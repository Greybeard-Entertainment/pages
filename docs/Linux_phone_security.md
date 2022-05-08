---
title: Linux phone (in)security
layout: post
lang: en-US
sidebarDepth: 2
---

# {{ $frontmatter.title }}

Recently, my acquaintances sent me an article called "Linux Phones". Its
author, Madaidan, claims that Linux phones are a "a major degradation from
traditional mobile operating systems, such as Android or iOS". The author
didn't seem to be much interested in objectivity: true both Linux and GNU+Linux
phones do have some significant security flaws, however, the author seems to be
blind or oblivious to similar or significantly bigger threat vectors associated
to the other two operating systems. Rather than dismiss the author's point of
view as banal shilling hidden behind a veneer of professionalism, we shall try
to address their points one by one…

> Linux phones lack any significant security model and the points from the
> Linux article apply to Linux phones fully.

OK. So the arguments are made in bad faith, and while we wanted to have a fair
and balanced discussion on the topic of Linux security, we instead are in the
unenviable position of having to meticulously pull apart Madaidan's arguments.

Unfortunately, the moment you claim gross incompetence, you invite yourself to
scrutiny, and you'd better be prepared to handle it. When we started this
article the intention was that we would simply reflect on a few points and in
the typical reasonable, measured fashion as most Linux users (I said most not
all) ordinarily respond to critique of their platform of choice, uncover the
truth and move on. Instead we have an open invitation to revel in verbal
proctology and potentially destroy the credibility of a security researcher. I
don't want to make enemies. I want to make friends. But if someone opens the
conversation by spitting in your face and claiming gross incompetence… let's
just say peaceful resolution is no longer an option.

And the first nitpick would be listing a
[DogeCoin](https://ru.wikipedia.org/wiki/Dogecoin) wallet as a method of
supporting oneself. If one considers themself a security researcher, nay a
competent security researcher with compelling views contrary to experts in the
field, one must strive to appear professional. I don't need to point out that a
Cryptocurrency called [DogeCoin](https://ru.wikipedia.org/wiki/Dogecoin) has
more red flags than an actual textile factory that ran out of all dyes except
red, specialising in flag production.

## They do not have modern security features:

OK. Define modern. It's tempting to say that the following list contains the
aforementioned security features, but things like Verified boot are neither
modern (["Secure"
boot](https://en.wikipedia.org/wiki/Unified_Extensible_Firmware_Interface) was
introduced in 2011, and [has more to do with locking the user out of hardware
that they bought](https://www.devever.net/~hl/secureboot), rather than
preventing malware settling in. Moreover, it fails to mention that in most
cases such features are security theatre, and Microsoft [has an exceedingly bad
track
record](https://arstechnica.com/information-technology/2016/08/microsoft-secure-boot-firmware-snafu-leaks-golden-key/)
in implementing such features.

Application sandboxing is also highly dubious: most web browsers and virtual
machines are hardly modern ([V8](https://v8.dev/) released in 2008, VirtualBox
released in 2007, SpiderMonkey is claimed to have been worked on in 1996, and
if you ask me, the earliest proper example would be the JVM, that [appeared in
1995](https://www.forbes.com/sites/oracle/2015/05/20/javas-20-years-of-innovation/?sh=1aaeebc11d7c)),
hardly absent from Linux (you have access to all of the above +
containerisation), and most definitely qualify as strong sandboxes, in a sense
in which any useful program *can* qualify as a strong sandbox.

### [MAC policies](https://en.wikipedia.org/wiki/Mandatory_access_control)

[AppArmor](https://ru.wikipedia.org/wiki/AppArmor). This omision is telling.

[SELinux](https://en.wikipedia.org/wiki/Security-Enhanced_Linux) is another
glaring omission (not from the article, but from the discussion of Mandatory
access control policies), since it is good enough for the [U.S. Department of
Defense](https://www.redhat.com/en/solutions/public-sector/dod). At this point
it is safe to say that this article is not well-researched. In fact,
considering that the author is fully capable of identifying the relative
popularity of bubblewrap, it is far more likely that the omission of AppArmor
and SELinux is intentional.

SELinux is currently both the most widespread and most effective means of
mandatory access control on Linux. Madaidan concedes to some of SELinux's
virtues in an unrelated part of the article,

> SELinux does provide the `execmem` boolean, this is rarely ever used.

though in a typical fashion, taking statistics out of their own thinking
apparatus, with said apparatus firmly lodged in a comfy chair, at the very
bottom of their being.

I will point out, that of the [MAC
policies](https://en.wikipedia.org/wiki/Mandatory_access_control) are not too
well implemented. I can off the top of my head remember what I need to do on
Mac, to restrict access to Accessibility features (i.e. keylogging), but I
don't know what the appropriate policy is on SELinux. It should be said,
though, that by the very nature of Wayland, it being the default on Gnome, and
Gnome being the default for many distributions, I don't think that there's any
need to disable accessibility features for one particular application.

What is more worrysome is that the MAC implementations in both Mac OS and
Windows are sub-par. Windows is laughably inept, in that it thinks that UAC
prompts (which most people disable, BTW), are sufficient to ward off malware.
The problem at hand is lack of granularity: you want a program to install Adobe
Acrobat on your system, and you trust (or rather believe), that if you uncheck
the box that says "install McAfee antivirus", that it will do the honourable
thing and not install it. So when the prompt comes up, you say "yes", and now
you have the Ask toolbar, and god knows how many trojans.

![](https://i.stack.imgur.com/lWIBN.png)

Mac OS is slightly better in that regard. It does have things approaching a
pacakge manager: the trouble with the App Store is that most applications are
not distributed through it. Simply put there are large incentives not to, in
the size of the 30% … ahem… 27% cut that Apple takes. The user does, however
gain access to automatic updates, and genuine ease, because someone at Apple
really did look at the source code. The problem with MAC, is that applications
that shouldn't, often ask for bizzarre permissions: for example Karabiner
elements asks for accessibility permissions. What it actually asked for, was
access to the Accessibility API, which is the only way of getting some kinds of
information on Mac. You should be judicious about what kinds of access you are
providing to your apps, and Apple App store products often don't make that
easy. I'm conditioned to provide Accessibility access when prompted, even
though I 100% know that it's used for keylogging.

Apple does do it better, not in terms of security but in terms of usability:
SELinux is a pain to set up, configure and use. I don't, off the top of my
head, remember where to go in the settings on Fedora in order to tune SELinux
policies. On Apple while I'm much more limited in what I can do, I know
precisely where to go for it, and how to revoke accessibility access to any
programs I suspect of spying.

![](https://i.imgur.com/m8nIRgy.png)

### Verified boot

This is BS.

First of all this is factually false, since the author neglected to mention
that both the cheap PinePhone and the expensive Librem 5, both ship with
U-boot, they do however omit the vendor lock, which is the sole purpose of the
solution's existence.

Secondly, even if that statement were slightly better researched, verified boot
is an ineffective security measure that's meant to lock a user out of their
personal electronics, more than provide peace of mind.

Verified boot is a solution looking for a problem. The typical spiel, that
you're given goes as follows: secure boot protects your machine from running
unauthorised kernels/UEFI binaries. This is factually correct, but a loaded
expression: authorised usually means "having a proper signature". That is not
synonymous with "came from a trusted software vendor" as was demonstrated by
[Microsoft](https://arstechnica.com/information-technology/2016/08/microsoft-secure-boot-firmware-snafu-leaks-golden-key/).

The key problem is that blessed UEFI binaries can be signed on the device
itself. Now consider who might want to install a malicious kernel/boot loader?
You need to either have full access to the system remotely, including root
access in order to modify the bootloader (since most unix-like systems don't
let you change boot options willy-nilly), or you need physical access to the
device.

The first case is obviously not tenable; if an attacker has remote root access
to your device, it's not much of a consolation that they can't get a malicious
kernel to boot. You can set up an Orwellian nightmare in userspace any day of
the week, with root access to your device no less. The only salvation in such a
case is (counter-intuitively) to flash the device with a fresh operating
system. Now you could say "AHA! But because there's no secure boot they could
have installed a rootkit, and now you can't be sure that the device is clean?"
To that I would say, "good luck flashing the contaminated (in this case both by
secure boot and the rootkit) system in the first place". Not to mention that
since you **can** update the kernel, the likelihood that you'd need to flash
your system falls drastically too: if the number of kernel binaries is limited,
the attacker knows precisely what to attack, and exploits are inevitable. It's
a lot harder to exploit `sudo` on a platform that doesn't guarantee that `sudo`
exists, and isn't an alias to `doas`. More on that later.

Now suppose that you are in the even less enviable position of the attacker
having access to your device physically. You're fucked. No encryption is
soldering iron-proof. If they're after your data — either security measures
other than secure boot will deter them, or Secure boot will slightly increase
the time it takes for them to get to your data.

Does having secure boot add to your device's security? Perhaps. I just don't
think that "maybe deter someone who has already gained quite a lot of ground on
my system" is not a good trade-off for "definitely make my choices fewer and
further between."

### Physical access means all bets are off

There are companies like Cellebrite who manufacture hardware and software
complexes, giving their owner an ability to access mobile hardware. There's a
[Youtube video advertising their
solution](https://www.youtube.com/watch?v=B3zpROoPOwQ).

Yes, the intention is to help police investigations… for now… however Such
devices could be lost, stolen, if an average Detective Wiggum, can have access
to it, it means that using the hardware is easy and very little verification
has to be done… In other words there's nothing stopping an enterprising youth
from buying such a device off a cop and using it for the same purposes as they
would a rootkit. Do you honestly think that Secure boot is going to protect
against this sort of attack? To be clear, if you're worried about rootkits, you
should be worried about a software analogue of this solution. And Secure boot
demonstrably doesn't do jack shit against this hardware.

While Apple claims to care about privacy, it is nowhere to be seen when such
means are on the table. I mean, sure, they [refused to hack a terrorist's
phone](https://www.theguardian.com/technology/2016/feb/22/tim-cook-apple-refusal-unlock-iphone-fbi-civil-liberties)…
but then again, it was possible to hack without their help.

[The Hated One](https://www.youtube.com/channel/UCjr2bPAyPV7t35MvcgT3W8Q) did a
detailed video on a [whole zero-day exploid
market](https://www.youtube.com/watch?v=LOPWNJxdxWY).

You'd be surprised to hear that something like TailsOS would actually help in
this regard. If you don't keep a lot of this information locally, data recovery
is going to be much harder.

### Strong app sandboxing

Yeah. Linux doesn't have it. Fedora Silverblue is a figment of out collective
imagination and it cannot possibly be installable. Tails OS? Yeah, that's
probably a Mac OS spin off and Qubes is based off of Microsoft Windows 9, the
unreleased gem.

Jokes aside, I think Linux does need the means to sandbox some untrusted
applications, which it does have, sadly. Fortunately we have AppArmor, SELinux,
Firejail and Bubblewrap, all of which can cover MAC, as well as provide a form
of sandboxing. We do not need it in the vast majority of cases, however,
because most applications have publicly auditable source code, and most
distributions have a transparent method of package compilation and delivery.
There's no need to sandbox KDE applications, because they will not maliciously
attack your system. And if you think that nobody audits the packages, I
encourage you to try and publish malware on Debian, just as an illustration.

However, the author oftentimes makes a passing mumbling reference to Mac OS X
being better, without actually providing any proof. So let's talk about that
for a moment. There's a fundamental difference between an executable and an app
bundle. Most programs on OS X and IOS are bundled with their dynamic libraries
[1], but some applications can be distributed as bare executables. These
executables are in no way limited beyond what they could access on Linux. So
suppose you have an app that you don't trust. How the hell do you know that it
isn't calling another bare executable and bypassing all of that sandboxing?

On Windows, it's a little more clear cut: UWP apps are indeed sandboxed. It
would matter, if they were anything but a superminority of apps available on
Windows. The vast majority are `.exe` kinds of executables and they can do a
whole lot to your data. Sure, they need to ask for administrator privileges
first, to have access to anything other than your documents folder, but that's
true of Linux as well, and to a far greater extent of Mac OS X too.

[1] which in Linux is called dependency pinning. This practice is not itself
problematic, but it requires the author of the package to responsibly update
the versions of all of their dependencies alongside the main executable. Debian
Greybeards will already be furious, because updating the dynamic library is far
easier than updating the entire bundle, and happens far more frequently than
either the user or one of the App Stores actually updating the bundle.

### Modern exploit mitigations [OLD KERNELS]

The only real competition here is Apple. Android by definition is not a
contender, because of the fact that most phones lose software support after 18
months at most. And before you counter with "but ""security"" ""updates""",
consider that a large number of perfectly functional Android 4 devices with no
upgrade path are becoming obsolete. Nominally they do still receive updates,
but in reality even if the company that originally released those devices has
not gone under, support for such old versions is tenuous, if at all present.

I can only speak from experience, but Apple doesn't push updated kernels all
that frequently. You can expect at most one security update at least every two
months. Meanwhile on Arch (i.e. Manjaro), you can expect a kernel update every
week, sooner if you're compulsively doing `pacman -Syu` every time you get the
chance.

This argument is moot, primarily because Linux is already the largest publicly
developed software project, with the largest amount of buzz around it, with
millions of lines of contributions each day. No matter how large Apple might
be, or consider themselves to be, they cannot hope to match the same level of
exposure. This exposure comes with what's know as the [Linus's
law](https://en.wikipedia.org/wiki/Linus's_law): given enough eyes on the code,
every bug is obvious. Apple alone, hope to match, far less exceed the
expediency with which security flaws are discovered and fixed, and only so
because of the large userbase, and unfettered access to gigabytes of internal
telemetry, and being the only de-factor software developers on the platform.
Contrast that with Android, where if Samsung discovers a security flaw, they
can only quickly patch said flaw on Samsung devices, and only after some
backporting, can the same fix be applied to a OnePlus.

The fact that Apple are really the only competitors in terms of security will
be a running theme in our article.

> Most programs on Linux are written in memory unsafe languages, such as C or
> C++, which causes the majority of discovered security vulnerabilities. Other
> operating systems have made more progress on adopting memory safe languages,
> such as Windows which is leaning heavily towards Rust, a memory safe language
> or macOS which is adopting Swift.

I'd hate to break it to you, but if any stupid line should get you fired it's
this one.

To start with, **ALL OPERATING SYSTEM KERNELS** which want to be competitive
with Mach, minix, Linux and NT are written in programming languages with manual
memory management. This is a necessity. Anything as complex as a live garbage
collector is too large for kernel bootup and an extreme security risk. This
still allows Nim and Swift as potential candidates, and heavily favours Rust,
while the historical favourites are still C/C++ and assembly. Why? Primarily,
because the people who know how to design an operating system kernel have spent
most of their time practicing one kick a thousand times, rather than
complaining about programming languages.

Secondly, you can write FORTRAN in any language. What this ancient saying is
meant to express is that most programming languages only provide a harness that
stops you from writing harmful code. It is perfectly possible to leak memory in
Rust, and invoke undefined behaviour in Swift. The kinds of low-level
performance optimisations that are necessary for a smooth-operating kernel are
likely to require you to disable many of the safety features. You could say
that in-general Haskell is both memory safe and extremely good at tracking
side-effects. The assumption being that the vast majority of the program
doesn't reside in the `IO` monad, invoking `malloc` via Foreign function
interface, and leaking all the memory ever allocated, by arguing that "Haskell
has a garbage collector", thus calling `free` via FFI is not necessary. I'm a
Rust developer by trade, and believe me, there are precious few who appreciate
the challenges associated with `unsafe`. Of all the known systems programming
languages, only a small subset of rust can be considered memory safe. The best
known operating system kernel written in Rust is RedoxOSs kernel, and neither
Mac OS, nor Windows nor Linux intend on adopting `rust` as more than an
*acceptable* language for *some* modules (stay tuned for my critique of
rustlang). I sincererly doubt that with the crust that's ever present in
Windows,  Rust would account for more than 1% of the total code-base.

On Mac OS, it's slightly different. Can swift replace C/Objective C or C++ in
the long run? Possible, but extremely unlikely. Reference counting alone is not
a sufficient memory management strategy, especially in cases where process
isolation among many other operating system features are not available. Nim and
Rust can get away with reference counting most of the time, primarily because
they enforce strong guarantees otherwise. Swift's reference counting errs on
the side of caution, and expressiveness, sacrificing performance. In plain
words, it means that Swift shall be avoided in the performance-critical regions
of the OS kernel, and some aspects of it would still be written in (Objective)
C.

> While Windows and macOS are still **mostly**…

First of all, we'd have to take the author's word for it. Even if they saw *a
source code* for something that looks like the NT kernel, there's no guarantee
that it is *the* source code for the kernel. Secondly, I would estimate that
Windows has a generous 1% of its kernel logic re-written in Rust, if any of it
is functional at all. Linux is not far ahead in that regard, but using a
memory-safe language doesn't guarantee memory safety.

> written in memory unsafe languages, they are at least making some progress on
> switching to safe alternatives.

Which is also true of Linux. Specifically, `rust` is admitted by Linus Torvalds
to be a vast improvement over C++ and suitable for driver development. It is
questionable whether unsafe rust is better than unsafe C, especially
considering that there are no rust programmers with 30+ years of rust
development experience as there are C programmers with 30+ years of C
development experience.

And again, this comparison is completely unfounded. Can you point me to a
source where I can see a core NT kernel function being reimplemented in `rust`?
Or can you point me to a source quoting that Apple are planning on using Swift
for their kernel? It would also be hamstrung by the fact that as far as we
know, the kernel used by apple is a heavily modified Unix kernel, based off of
BSD, which is written in… drum roll… memory-unsafe C.

## Kill switches

> The microphone kill switch is useless since audio can still be gotten via the
> sensors (such as the gyroscope or accelerometer)

Or you could have another microphone that's not connected to the kill switch
and isn't exposed to the OS. I'm surprised that a seasoned security "expert"
jumps to the least practical exploit.

> Librem 5 does have a "lockdown mode" that disables the sensors, it also
> requires flipping all of the other switches, including the network switches
> which effectively turns your device into a brick just to prevent audio
> recording.

Wasn't the author's point earlier, that other sensors could be used to get
audio? So why are you now complaining that it also (just to be safe I must add)
disables the network connection? And my device would still be able to play
games, perform non-network-related activity, though probably without a
gyroscrope.

>  To prevent cell tower triangulation, you can simply enable airplane mode and
>  it is just as effective.

Provided you know precisely what an Airplane mode does. Let me clarify. I
haven't seen the code for Airplane mode in the source code for my Android 9
device. Probably because it's a Samsung device and the source code for the OS
can not be found anywhere. With IOS, it can spontaneously decide that Airplane
mode is not needed anymore and turn it back off based on criteria that I don't
know. It's one of those "convenience features" that end up biting you in the
long run.

Also, I guess that being a security researcher, you have option of signing an
NDA and viewing the source code for both IOS and Android. How the hell am I
supposed to know that

1) what you're saying is voiced because it's true, not because it's what you
   have to say as per some terms (of e.g. the aforementioned NDA).
2) what you're saying is based off of the actual source code for the OS
   components, and not a revised version designed specifically for security
   researchers.
3) that you are qualified to say whether or not a given source code fits the
   criteria of being useful for cell-tower triangulation.

The third point is only present because of a worrying amount of mishaps that
have been caught. I don't consider myself to be qualified to review the
airplane mode source code. Even if I did, I'd suspect a hardware backdoor, that
cannot be circumvented even with a kill-switch. I do not believe that you are
in any way more qualified to judge these things even if you had access to the
OS source code. There are far too many omissions in the rest of your article,
Madaidan, for you to plausibly be able to identify flaws in Apple devices.

> The network kill switch is useless for preventing data exfiltration since the
> attacker can just wait until you toggle the switch on again to exfiltrate
> data. If you need to temporarily disable network access, you can use airplane
> mode. Airplane mode can be disabled via a software vulnerability, but if an
> attacker has those capabilities already, then they can also simply sit and
> record any sensitive data and eventually upload it once you re-enable the
> hardware network kill switch, making it no more effective than airplane mode.

This is the part, where I'm sure most serious people in the audience are
performing their favourite facepalm manoeuvres. A statement this dumb, on a
blog post by a security researcher should immediately get you fired.

The biggest problem with "Airplane mode" as I said previously is

1) I don't know precisely what it does, and it highly depends on the device. I
   get that the author of the article may have been one wee few that was given
   a glimpse of what they think is the source code for the aforementioned "more
   secure" proprietary operating systems. The author would do well to read
   "[Reflections on Trusting
   Trust](https://www.cs.cmu.edu/~rdriley/487/papers/Thompson_1984_ReflectionsonTrustingTrust.pdf)",
   and draw their own conclusions, about how incredibly stupid it is to rely on
   a software kill switch, if the likely area that can be compromised is also
   software, but not hardware. I can't spoof a hardware switch without a few
   weeks with the device, and a ton of microsoldering equipment. I can spoof an
   overlay that presents itself as the nebulous "Airplane mode" in a few hours.
   Less if I have access to a team of programmers.

2) it's a software lock. It can be disabled in a myriad ways, only one of which
   implies the kind of access that was mentioned. Most data exfiltrations are
   time sensitive, often getting information on a rendezvous location is
   useless after the rendezvous took place. The author, of course, also ignores
   that the owner of a Linux phone probably has a few more tricks up their
   sleeve if they suspect data exfiltration: for example, a full reboot into a
   core set of trusted applications, possibly on a different partition on the
   same physical device. The fun fact about that, is that the core set might
   also include a change in security policies and a completely different set of
   tools: a different package manager, init system and a completely orthogonal
   threat vector.

> The camera kill switch can be useful as a small usability improvement, but it
> is really no better than some tape.

I'm guessing that the author never had to clean off tape residue off of the
camera.

>  Hardware kill switches are nothing but marketing frills.

I agree, but not for any reason presented in the text. Hardware is complex.
Some pieces of hardware can be self-contained and self-powered, not to mention
that without a concrete trace layout, even ignoring the fact that your camera
might still spy on you in the "off" state, I can't even tell if the switch is
doing anything at the hardware level, or just telling the firmware to pretend
that it can't access the hardware.

The reason why I bring this up, despite agreeing with the general sentiment is
this: to kill an argument, you only must defend it badly.

## PureOS is not particularly secure

In the sense in which it is not significantly more secure than e.g. Debian, I
agree. In the sense that Debian isn't the most secure base I also agree. I'm
even willing to concede, that in some ways Apple devices are more secure too.
But the assertion that it is in any way inferior to Windows or Android to me
seems laughable.

> PureOS does not apply the exec-shield patch

Not applicable to non-x86 architectures.

> so that sysctl doesn't even exist in the first place.

So many mistakes in this one phrase. First of all `sysctl` does exist on
PureOS, secondly, the existence and non-existence of `sysctl` has nothing to do
with the exec-shield patch, and thirdly, the presence of `sysctl` isn't
necessarily a good thing in terms of security.

> The purpose of disabling kexec is to prevent root from booting a malicious
> kernel,

No. The purpose of disabling `kexec` is to prevent `root` from loading a
malicious kernel on top of the currently running one.

> but root can do so many other things to modify the kernel, such as loading a
> kernel module.

Or changing the default kernel in the bootloader. These are true statements
that have no bearing on the argument made: if an attacker gains root access on
Windows, Mac OS, Android and IOS you're fucked. Disabling `kexec` is not going
to change that, but it will reduce the potential for non-root users to use an
SUID application to gain root access and install a malicious kernel withtout
rebooting. Here the presence of a security measure like Verified boot would
have been useful, in the sense that the attacker might need to do more work to
get a malicious kernel running on your device, but not significant.

> Attempting to hide kernel symbols via kptr_restrict ignores the fact that
> they're clearly visible in the System.map file on disk, among other sources.

This is probably the only argument that makes sense… on some level… You see,
kernel symbols genuinely are more vulnerable on Linux than on Mac OS or
Windows. The `kptr_restrict` is used more as a protective measure against
programmer error, rather than a security restriction to genuinely protect
kernel symbols from outside attacks. I do, however, suspect that at some point
this might change and the other sources of access to kernel functions is going
to be reduced to none, given enough time.

Linus Torvalds is acutely aware of the kernel exploits, and if Linux were to
become a wide-spread target, there is great incentive to fix these problems.
More to the point, since Linux is free and Open Source, forking it, hardening,
and patching it is never out of question.

> And finally, disabling source routing is already a Debian default.

Yeah. So somehow using sane defaults is a sign of being "not particularly
secure". The problem here, of course isn't just of double standards, but of
semantics of conversational english. If an english-speaking, particularly
british person tells you that "X is not particularly Y", where Y is some
positive metric, the implication is that X is below average in terms of Y. By
operating system standards PureOS is comparable to Mac OS in terms of security.
It loses in usability and stability, of course, but being tied with the top
non-Linux contender is hardly below average. And Linux can offer much more
secure systems by design. Tails and Qubes could work wonders on Pinephone. If
only Madaidan worked on that instead of propagating his contrarian opinion.

This latter point is especially interesting, because Madaidan is allegedly
involved in the development of Whonix.

I do not think that Madaidan is stupid enough to use dubious arguments to
support strong claims. Of the many operating systems that he's comparing, only
Linux on desktop and Linux on phones have all the variables known. You can only
certainly claim that Linux does X thing the Y way, which opens them up to the Z
attack vector, anyone can in principle look at the source code and barring
compiler issues, convince themselves of the validity of that claim. We cannot
however do the same with Mac OS. For all we know, any of the features claiming
to protect our privacy might be security theatre.

Another point against Madaidan's arguments is that when taken in a vacuum they
are inconsistent, and given the context, incredibly short-sighted. On the one
hand, he has a habit of citing some statistics out of thin air. W feature
mitigates the Z attack vector on Linux, but it's rarely used. In a vacuum, this
is a non-argument, the attack vector is either mitigated or not. If it's
mitigated even on one Linux distribution, then your previous claim is false.
When we add context things become even worse. Suppose Windows *does* mitigate
the vector Z. Suppose that we also concede that the dubious statistics are
accurate and the mitigation is made irrelevant by its infrequent and
inappropriate use by the majority of the distribution vendors. Well… in reality
the mitigation for Z is present on the latest version of windows. More people
run Windows XP than Linux, and I sincerely doubt that XP can have the requisite
mitigations even in principle. Not to mention that the average intelligence of
an average Linux user compares to that of a Windows user the same as the
intelligence of a Physics masters' student when compared to the cognitive
abilities of a banana.

In security, a system is considered only as safe as the weakest link. No matter
how hard you'll nitpick on Linux lacking X, you'd still be stuck with moronic
habits deliberately conditioned inside Microsoft's clients. Windows users are
so habituated to relinquishing control over their system to third parties with
at best dubious motivations, that even if the only way in which a Windows virus
could infect a Windows machine were if the user clicked "Yes I want my machine
to be infected by malware. Yes, I'm that stupid. And I also hereby consribe
myself to slave labour for a term of 40 years starting now", you'd still get a
large proportion of infected machines. The impenetrable learned stupidity of
Windows users is the real problem. It's the only security flaw.

Recently we had a long-time Windows user, [Linus
Sebastian](https://en.wikipedia.org/wiki/Linus_Sebastian) wipe their X.Org on
Pop!_OS_. This is 100% the habituation of idiocy imposed by Windows. He was so
used to programs showing walls of text that has no consequence and no
informational content, that when the program literally told him "What you're
about to do is incredibly dangerous and stupid. We need to know that you *know
what you're doing*, so type in **do as I say**", he ignored the text and typed
that in. Is Linus an idiot? No. Not inherently. Had he grown up on Linux, he
wouldn't have made that mistake.

### Linux Libre

> PureOS also uses linux-libre. This will prevent the user from loading any
> proprietary firmware updates which just so happens to be almost all of them.
> The Librem 5 prevents the user from updating new firmware even with an
> alternative kernel which forces the user to use outdated and insecure
> firmware with known vulnerabilities.

I agree… Kinda. I can see how an Apple device could compare favourably here,
since they control the full hardware stack, and firmware updates are not an
issue. I don't see how an Android device that uses a solidified kernel and
doesn't provide any updates to the userspace after a poultry two to three years
of use can possibly compare favourably here. Android screwed the pooch,
proverbially, and dropped the ball figuratively, even before hitting the
ground.

You do however, see a fallacy here. The assumption is that only a proprietary
firmware can be flahsed on a Librem phone, when in reality the whole point of a
FOSS firmware is that it is Open Source, and thus can be modified patching any
mitigations. Of course, this is the mindset needed to perpetuate the prevalence
of proprietary software.

> Although one way to fix the issues in software would be to install a more
> sane OS like Android or its derivatives, such as GrapheneOS, if support for
> the hardware was added. Keep in mind though that it would still lack
> important hardware and firmware security features like verified boot so it
> still isn't close to a normal Android device.

The way to fix these issues, dear Madaidan, is to ask you to shut up when the
grown ups are talking. I could have perhaps phrased this a bit more
diplomatically, after all, I want this to be a civilised discussion. Not
necessarily should have however, since even Jean-Luc Picard didn't shy away
from asking Wesley Crusher to "shut up". And then we get to the fact that
Wesley was a child prodigy saying mostly correct things in stark contrast to
Madaidan, whose every coherent idea is supported by the weakest arguments,
despite years of experience.

The author has demonstrated their incompetence in many ways throughout the
article, and I don't believe that it is possible to further discredit oneself
more than by picking the worst of two possible options.

Graphene OS, has none of the aforementioned weaknesses covered. Furthermore,
since it relies on largely proprietary "apps", it exposes itself to a far
broader range of attacks.

### and so on which modern Android phones already deploy.

First, I'd like to take this time to remind you of an old principle in logic
and debating: extraordinary claims require extraordinary evidence. Define
modern Android phone. Is it a Galaxy S22? Is it a Sony Xperia one two? Or is it
my Samsung Galaxy S7 edge?

Considering that both the Pinephone and Librem are based off of SoC's that are
comparable in both performance and age to my Galaxy S7, I'd be happy to make a
fair comparison.

First of all, my Galaxy S7 edge doesn't receive updates. I bought it four years
ago, and call me old-fashioned, but I'd consider the one poultry year of
updates and two years of no updates whatsoever a huge security risk. one year
later, the same will be true of the S10 and one more – S22.

The reason why this is important is the following. What house is more likely to
get robbed? The house where the owner changes cheap locks periodically, or a
house with an expensive lock that gets abandoned for years? The state of
"modern" android phones is likely to be frozen for a while. At the same time,
every single one of the arguments presented here, had they been merited, would
have been patched in a growing ecosystem of devices. Linux phone owners are
also the kinds of people who are likely to upgrade more than just the Operating
system kernel when given the opportunity.

And this is kind of important. The only valid argument in the entire article
had been that hardware kill switches are superfluous, every single argument was
beside the point.

## Examples

Oh boy. The author quite clearly invited us to compare their thoughts on Linux
security to the subject matter of this particular article. So we shall.

```bash
cat <<\EOF > /tmp/sudo
#!/bin/bash
if [[ "${@}" = "" ]]; then
  /usr/bin/sudo
else
  read -s -r -p "[sudo] password for ${USER}: " password
  echo "${password}" > /tmp/password
  echo "${password}" | /usr/bin/sudo -S ${@}
fi
EOF
chmod +x /tmp/sudo
export PATH="/tmp:${PATH}"
```

First of all, the original script lacked any syntax highlighting. It's not
essential, just an indication of how little effort was spent in considering the
example, though we shall see that in more detail if it's not readily apparent.

It might come as a shock, but not all `sudo` configurations are alike, and mine
shows asterisks whenever I type. Some systems don't come with `sudo` and most
often, good programs don't rely on explicit privilege escalation, but rather
rely on PolicyKit, which in my opinion is the superior solution, and we should
abandon all others. Often, we have what's called a `sudo` loop, wherein two
subsequent calls re-requesting the password would seem suspicious.

Another point of contention is the assumption that this is only specific to
Linux. Spoofing administrative dialogues is very much possible on OS X too. In
fact the very same script would work like magic on Mac OS.

But OK. Suppose we suspend the disbelief and assume that it *is* possible to
spoof `sudo`. I mean that script works, but it wouldn't work on my system for
the following reasons:

1) `sudo` is a fish shell alias to `pkexec`. Your script simply won't execute.

2) If you somehow bypassed the shell alias (and you have to target all shells,
   because Linux users tend to use esoteric stuff quite often), your prompt
   would be wrong. It would immediately give itself away, as a GUI prompt is
   starkly different to `sudo`.

3) Ignoring the two above facts, what if I don't run a prompt for certain
   actions. What if I specifically set `sudo` *not* to prompt for a password
   when using a package manager? I'd be immediately suspicious.

But of course, let's indulge in our suspension of disbelief a while longer.
Suppose that none of the above were true, and we *were indeed* oblivious to a
keylogging attack and you got a few useful exploits out of it. Suppose also
that the attacker got a little more sophisticated too. What's the most reliable
way to patch it out? Simple. Make `sudo` a shell builtin that cannot be
overriden and resolves to the proper `sudo` installed in the system. We kinda
did do that with `rm -rf /`, who says we can't do it now.

The real solution, of course, is to use `PolKit` and have it handle both
privileged password entry, and whether or not it can be called
non-interactively: I believe that even allowing a privilege escalation program
to be passed a password explicitly, without verifying the input was is a
mistake. `doas` doesn't have this problem either.

>  Alternatively, an attacker could log keystrokes via X11:

Guess what is being phased out in favour of Wayland? On Gnome, which is what
90% of Linux users run you'd have to go out of your way to use X.Org in any
capacity other than XWayland, which has the protection against keylogging.

No seriously, Wayland is going to be the standard on Desktop Linux, and it
still isn't because of a lot of 3rd-party developer complacency and a bit of a
small early-adopter chicken and egg problem.

With that said, if you have to use X11, I would advise attaching  some form of
notification to running `xinput` . If you are using `PolicyKit`, you don't need
to do much, because the input is grabbed exclusively, and no other application
can view that privileged information.

But that's not all. I once wrote a Mac OS X keylogger as part of a job
interview. It took me a week at the most. And it didn't just log keystrokes,
that's trivial, it logged the cursor entering various applications and it even
extracted the URL of what you were looking at in Safari and Firefox. The
keylogger itself can be cobbled together in a few hours, by the way, the real
reason it took me a week, had to do with that I had to write a whole GUI Qt
application, and it was my first bottom up build + deploy.

Finally, if we're really asking for my opinion, passwords are dumb and an
inadequate security measure, which most phones don't even use. A Linux phone
will probably follow Apple and Google's lead, and handle most if not all
authentication either via a weak-ass passcode, or biometrics, which can still
be spoofed, but not without physical access. In my not-so-humble opinion, you
need a hadrware solution, like YubiKey, combined with a biometric solution.

> Those listed above are merely a few examples and do not even require
> exploiting bugs.

They are indeed examples; they require a suspension of disbelief. It's not
unlikely that a Linux user would have uncostomised bash, and my use case is
probably niche. However, it is fallacy to assume that someone who uses an
uncostomised command line would prefer to use `sudo` in general. You can easily
have a rolling-release Arch install and never touch the command line: I do it
right now, in fact. Garuda and Manjaro and heavily customised Arch have a full
set of tools that make using CLI programs redundant. Good luck spoofing an
`fprintd` equipped Polkit authentication dialogue, and the entirety of Gnome
Software. It's doable, but more effort than on Mac OS and windows, because
instead of a single and standard point of entry, you have multiple
non-overlapping ones.

This is an assumption that would hold true in some cases, however, so we should
propose a solution to those as well. One particular solution is to periodically
check your `.bashrc` and environment variables. Most applications warn you if
you run them with `LD_PRELOAD`, which must be explicitly disabled on a
per-application basis.

Weirdly, this article is a good illustration for why Linux phones would be far
more secure than e.g. IOS or Android devices: if some half-baked security
researcher finds a way to break something and find an exploit, it will get
patched either by the creator of the software, or by some enterprising avid
reader of \<insert pretentious security blog name here\>. Meanwhile, Apple,
Google and Microsoft are content sitting on bugs for decades, because they can
simply buy out the bug bounties.

With that said, Linux is far from being 100% secure. No system can be. But it
takes more than a self-identified security expert and buzzwords like MAC
policies, verified boot and `<trendy buzzword #3>`. The writer clearly has an
extremely superficial acquaintance with real security work, all they did was
collage information already available to them. They have an extremely
superficial acquaintance with Linux as well. They seem to know that bubblewrap
is less common than firejail, but don't seem to know that almost all of what
they described applies to Mac OS, IOS, Windows and Android to the same if not
greater extent. The lack of self-discipline in terms of value judgements leaves
any unbiased reviewer biased against the author, which is unfortunate.

We need articles *like this one*, in the sense that we need to look critically
at what can be done to improve the security of the most widely used server OS.
What we do not need, however, is low quality shill pieces. I really wish I
could say otherwise, but Madaidan's unrestrained value judgements and
statements of fact, which turn out to be based on fairly weak assumptions and
malicious leaps of logic that give a free pass to anyone uncritically accepting
even somewhat plausible explanations for extremely unlikely statements.

## The "great" contrarian

It should be noted that the general consensus on Linux is that it is inherently
more secure than Windows. I firmly believe that Madaidan's blog post is partly
motivated by the desire to appear contrarian, to show off these pesky stupid
experts and thus elevate themself above and beyond the alredy well-regarded
intelligent people. A similar occurrence in my field is the unexplainable
disdain for String theory. Since string theory is hard, an expert in it is a
step above a physicist doing climate, so naturally if you shit on string
theorists, you feel like you're even cooler than they are.

The two articles: the piece on the security of Linux and Linux phones runs
contrary to common sense, to the opinion of the vast majority of security
experts and to the professional choices of MadAidan. There is a reason, why
there are still a handful of known unique pieces of Linux malware, hundreds of
known Mac OS trojans, and millions of incidences of Windows viruses. And no,
it's not because Linux is a small community with a small install base,
containing nothing more than their owner's hopes and dreams… Windows is a toy
operating system, that while dominant in the PC space, is almost completely
irrelevant in mobile devices, supercomputers, and servers. Mac OS, similarly,
is rarely seen outside of the so-called Apple ecosystem. If fewer installs and
no useful data should result in less malware, by all rights Linux should have
been the number one target for the better part of this millenium. Linux is not
more secure because of its predicament in the PC arena, but despite it.

Throughout this piece we have provided counter-arguments to each of the
presented issues. However, we should note that the authors of this article do
not think that Linux is the most secure that it can be, or that critical looks
at Linux security can only stem from a contrarian-ness and paid promotion of
competing standards. We actively encourage people who work on Linux, to provide
valid critique provided that a few common courtesies are observed.

> Extraordinary claims require extraordinary evidence.

Sources are good. Every claim should be substantiated with data and/or logic.
Some claims like "and is rarely used" are acceptable, being that it is your
opinion that something should be used more frequently. If on the other hand it
is used to say "Something exists and invalidates my point, but fortunately it's
rarely used", you should supplement this with a reliable source.

> Clichés are not inherently bad, they became clichés precisely because of
> being effective.

Sometimes the accepted opinion is also correct. If the consensus amongst a
community is that the Earth is an oblate spheroid, anthropogenic climate change
is measurable and civilisation-threatening, claiming otherwise is extremely
damaging. Claiming otherwise, whilst also abusing your high social standing is
doubly worse.

> Even the sun has spots. To err is to be human.

It's Ok to be wrong. It's Ok to be wrong about somethng that you specialise in.
The only person that gets fucked over when you leave no room for concessions is
you, when you are inevitably found guilty of being incorrect.

> Even the broken clock is sometimes right.

And sometimes you will occasionally be right. It won't save you. We have to
agree with you all along the way, and not in a few very specific narrow cases.

> A cornered animal is the most fierce.

If you leave the defendant in a position in which they have to concede gross
incompetence they will never be converted. Sometimes that's precisely what you
want, but often, if you want someone to change their opinion, it's better to
give them the benefit of the doubt, and provide an escape hatch.

> The best way to defeat an argument is to defend it badly

>> Neitzsche

Often, the smartest thing you can do is shut up. The second smartest thing to
do (given that you've already dispelled the illusions of intelligence), is to
concede wrongdoing. But the single dumbest thing to do is to misrepresent a
valid point of view. Linux is not 100% secure. The worst thing you can do to
ruin this point's credibility is to compare it to other operating systems that
cannot match it.

> Truth is the ultimate goal of the argument

Your motivation should be to uncover the truth and dispel misconceptions. If
all you do is advertise and idea, you are no longer a living human being with
thoughts and meditations, you're a product, and your thoughts are content. Be
mindful of that.

> and so on

**AND SO WHAT?!** If you had provided verifiable irrefutable arguments to prove
your contrarian point, the "and so on" would insenuate, that you have more in
store that you just didn't bother with, because it was lower quality and/or
very technical. Had any of your points A) been correct, B) been supported by
the strongest arguments that are accessible to you, and C) been verifiable;
this proverbial mike drop would have served you well. The problem is that most
of your arguments are A) incorrect, B) supported by implausible bullshit that
seems far fetched even if we give you the benefit of the doubt, and assume you
have information we don't, and C) is completely irrefutable in the Popperian
sense, because it assumes access to information that is not commonly available,
the entire "and so on" translates to, "there's stuff that's somehow even less
convincing than my post". I'm intrigued.

I mean really, are we meant to tremble in fear and choose to go back to Windows
or Mac OS? What is the intention behind all of this? You're not fooling anyone
with a functioning brain and access to Google, Bing or DuckDuckGo. Is this
meant for business executives?