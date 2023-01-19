Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pIW7j-0003v0-7Q
	for mharc-qemu-riscv@gnu.org; Thu, 19 Jan 2023 09:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pIW7h-0003ue-TT
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:42:37 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1pIW7f-0000BI-Cw
 for qemu-riscv@nongnu.org; Thu, 19 Jan 2023 09:42:37 -0500
Received: by mail-ej1-x631.google.com with SMTP id v6so6227130ejg.6
 for <qemu-riscv@nongnu.org>; Thu, 19 Jan 2023 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WLm/26TDzMxR9AjqcQLVzx0EJOKTTp2Q5NhztMFa29c=;
 b=TBMCPeFMINvlR6sLfqmBm9/vaLQjMVVaZZNdyj3wfzPAho/+69TQfPAGmXBfcQgvE2
 3MvTFGEuGGhy10YgDigUsENiJ0WQ9QHP+FCn+M4x9x1Gv+33h+zvfPdAz3VQg5YfJ15C
 RBq8K4q5oaxmGElBG2xYzudAxiovhsDns7/JEomVxBoexfkvAbuMk7v7jiLFWlwH6Lf+
 v6NVPChBDRjuviN5jqAQLygyfD4s3RMzQF08cYUy38D0qCHIYTBopdBA07F+x7d87w49
 JejKb5gPur7f5jPjMFbXfHrzmRW0tlsWHSQz65j4IKCwbpU5xvBVjNpUzinQJltxSBAM
 px9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLm/26TDzMxR9AjqcQLVzx0EJOKTTp2Q5NhztMFa29c=;
 b=OrDSDf2iVv/tQC7EItenEbLd2KgZ3xUdKiM/Y9KGF8QD1K4+xuoPQYvfIlNHyzL66X
 WtzWMYmYaWkbjRESOvwNT7iE4iyalv3Ux7qKxFOKT//19mfvB105IKM1TAeXcZPuLASM
 8BYXigbqwvv9mCKOmLcjVxNDFbHgWMNj/Q1bSPhSrAHh+ZdbkX09s1DQ2Rb0iTzI9z/v
 wgbYkQBbXnFALrPU1p6hN1iEJftnHlqOn9uh8gLSDd1ZAljffGRPjbq9+6T6BK8mGim6
 yMI3z+v/dJ+Vjb4XcgRn5+V8uhIvKC2QiTJQ7HWnMc3vMe8IGFdsmfpOa0Liuz9wkgxE
 8Jxg==
X-Gm-Message-State: AFqh2kqR8w3FLoqBXJdnhyV2KC1kVvwDvgprOqXIqzd5fxs6guy08tq8
 WGdVS24dAHi8zg7CrK6lIX9ZWkdlp0z+R7YwpOcMHA==
X-Google-Smtp-Source: AMrXdXv3voXsg9/2Y7jvMhjyvqkA6fh7HJ4k9HF9m+X+9XeI2roUUcwozH3kKKuRBWbh7Eo3g8KfVZP0g0ezvWD0IIA=
X-Received: by 2002:a17:906:a3c3:b0:870:7c88:466e with SMTP id
 ca3-20020a170906a3c300b008707c88466emr788492ejb.140.1674139353359; Thu, 19
 Jan 2023 06:42:33 -0800 (PST)
MIME-Version: 1.0
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-5-armbru@redhat.com>
In-Reply-To: <20230119065959.3104012-5-armbru@redhat.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 19 Jan 2023 07:42:46 -0700
Message-ID: <CANCZdfrU4zVcepMj=B5EVUz-qhCDhMYDs+cYS5yfW1-G01PsbA@mail.gmail.com>
Subject: Re: [PATCH v4 04/19] bsd-user: Clean up includes
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org, pbonzini@redhat.com, 
 kwolf@redhat.com, hreitz@redhat.com, kevans@freebsd.org,
 berrange@redhat.com, 
 groug@kaod.org, qemu_oss@crudebyte.com, mst@redhat.com, philmd@linaro.org, 
 peter.maydell@linaro.org, alistair@alistair23.me, jasowang@redhat.com, 
 jonathan.cameron@huawei.com, kbastian@mail.uni-paderborn.de, 
 quintela@redhat.com, dgilbert@redhat.com, michael.roth@amd.com, 
 kkostiuk@redhat.com, tsimpson@quicinc.com, palmer@dabbelt.com, 
 bin.meng@windriver.com, qemu-block@nongnu.org, qemu-arm@nongnu.org, 
 qemu-riscv@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000763fdf05f29ef11f"
Received-SPF: none client-ip=2a00:1450:4864:20::631;
 envelope-from=wlosh@bsdimp.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2023 14:42:38 -0000

--000000000000763fdf05f29ef11f
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 19, 2023 at 12:00 AM Markus Armbruster <armbru@redhat.com>
wrote:

> Clean up includes so that osdep.h is included first and headers
> which it implies are not included manually.
>
> This commit was created with scripts/clean-includes.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  bsd-user/bsd-proc.h               | 4 ----
>  bsd-user/qemu.h                   | 1 -
>  bsd-user/arm/signal.c             | 1 +
>  bsd-user/arm/target_arch_cpu.c    | 2 ++
>  bsd-user/freebsd/os-sys.c         | 1 +
>  bsd-user/i386/signal.c            | 1 +
>  bsd-user/i386/target_arch_cpu.c   | 3 +--
>  bsd-user/main.c                   | 4 +---
>  bsd-user/strace.c                 | 1 -
>  bsd-user/x86_64/signal.c          | 1 +
>  bsd-user/x86_64/target_arch_cpu.c | 3 +--
>  11 files changed, 9 insertions(+), 13 deletions(-)
>
> diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h
> index 68b66e571d..a1061bffb8 100644
> --- a/bsd-user/bsd-proc.h
> +++ b/bsd-user/bsd-proc.h
> @@ -20,11 +20,7 @@
>  #ifndef BSD_PROC_H_
>  #define BSD_PROC_H_
>
> -#include <sys/types.h>
> -#include <sys/stat.h>
> -#include <sys/time.h>
>  #include <sys/resource.h>
>

Did you test this on FreeBSD 12? FreeBSD 13 has started to climb the hill
where all includes are independent, but much of that hasn't been merged to
12 yet. sys/types.h, at least, is documented as a prereq for both
sys/stat.h and sys/resource.h.

I know many of these are in os-dep.h, and I've had trouble in the bsd-user
fork with that and the layout of the code which has arguably way too much
in the .h files.

Also, why didn't you move sys/resource.h and other such files to os-dep.h?
I'm struggling to understand the rules around what is or isn't included
where?


> -#include <unistd.h>
>
>  /* exit(2) */
>  static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)
> diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
> index be6105385e..0ceecfb6df 100644
> --- a/bsd-user/qemu.h
> +++ b/bsd-user/qemu.h
> @@ -17,7 +17,6 @@
>  #ifndef QEMU_H
>  #define QEMU_H
>
> -#include "qemu/osdep.h"
>  #include "cpu.h"
>  #include "qemu/units.h"
>  #include "exec/cpu_ldst.h"
> diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c
> index 2b1dd745d1..9734407543 100644
> --- a/bsd-user/arm/signal.c
> +++ b/bsd-user/arm/signal.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>
>  /*
> diff --git a/bsd-user/arm/target_arch_cpu.c
> b/bsd-user/arm/target_arch_cpu.c
> index 02bf9149d5..fe38ae2210 100644
> --- a/bsd-user/arm/target_arch_cpu.c
> +++ b/bsd-user/arm/target_arch_cpu.c
> @@ -16,6 +16,8 @@
>   *  You should have received a copy of the GNU General Public License
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> +
> +#include "qemu/osdep.h"
>  #include "target_arch.h"
>
>  void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)
> diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> index 309e27b9d6..1676ec10f8 100644
> --- a/bsd-user/freebsd/os-sys.c
> +++ b/bsd-user/freebsd/os-sys.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>  #include "target_arch_sysarch.h"
>
> diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c
> index 5dd975ce56..a3131047b8 100644
> --- a/bsd-user/i386/signal.c
> +++ b/bsd-user/i386/signal.c
> @@ -17,6 +17,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>
>  /*
> diff --git a/bsd-user/i386/target_arch_cpu.c
> b/bsd-user/i386/target_arch_cpu.c
> index d349e45299..2a3af2ddef 100644
> --- a/bsd-user/i386/target_arch_cpu.c
> +++ b/bsd-user/i386/target_arch_cpu.c
> @@ -17,9 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#include <sys/types.h>
> -
>  #include "qemu/osdep.h"
> +
>  #include "cpu.h"
>  #include "qemu.h"
>  #include "qemu/timer.h"
> diff --git a/bsd-user/main.c b/bsd-user/main.c
> index 6f09180d65..41290e16f9 100644
> --- a/bsd-user/main.c
> +++ b/bsd-user/main.c
> @@ -18,12 +18,10 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#include <sys/types.h>
> -#include <sys/time.h>
> +#include "qemu/osdep.h"
>  #include <sys/resource.h>
>  #include <sys/sysctl.h>
>
> -#include "qemu/osdep.h"
>  #include "qemu/help-texts.h"
>  #include "qemu/units.h"
>  #include "qemu/accel.h"
> diff --git a/bsd-user/strace.c b/bsd-user/strace.c
> index a77d10dd6b..96499751eb 100644
> --- a/bsd-user/strace.c
> +++ b/bsd-user/strace.c
> @@ -20,7 +20,6 @@
>  #include <sys/select.h>
>  #include <sys/syscall.h>
>  #include <sys/ioccom.h>
> -#include <ctype.h>
>
>  #include "qemu.h"
>
> diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c
> index c3875bc4c6..46cb865180 100644
> --- a/bsd-user/x86_64/signal.c
> +++ b/bsd-user/x86_64/signal.c
> @@ -16,6 +16,7 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> +#include "qemu/osdep.h"
>  #include "qemu.h"
>
>  /*
> diff --git a/bsd-user/x86_64/target_arch_cpu.c
> b/bsd-user/x86_64/target_arch_cpu.c
> index be7bd10720..1d32f18907 100644
> --- a/bsd-user/x86_64/target_arch_cpu.c
> +++ b/bsd-user/x86_64/target_arch_cpu.c
> @@ -17,9 +17,8 @@
>   *  along with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
>
> -#include <sys/types.h>
> -
>  #include "qemu/osdep.h"
> +
>  #include "cpu.h"
>  #include "qemu.h"
>  #include "qemu/timer.h"
>

I suppose these are fine. How do I run the cleanup script? I have 2x the
number of files not upstream in the bsd-user fork that I'd like to cleanup
as well and they are likely a bigger mess and I'll just upstream them in
the messy state unless I understand how to keep the neat :).

Warner

--000000000000763fdf05f29ef11f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 19, 2023 at 12:00 AM Mark=
us Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Cle=
an up includes so that osdep.h is included first and headers<br>
which it implies are not included manually.<br>
<br>
This commit was created with scripts/clean-includes.<br>
<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0bsd-user/bsd-proc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| 4 ----<br>
=C2=A0bsd-user/qemu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 1 -<br>
=C2=A0bsd-user/arm/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 1 +<br>
=C2=A0bsd-user/arm/target_arch_cpu.c=C2=A0 =C2=A0 | 2 ++<br>
=C2=A0bsd-user/freebsd/os-sys.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 +<br>
=C2=A0bsd-user/i386/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +=
<br>
=C2=A0bsd-user/i386/target_arch_cpu.c=C2=A0 =C2=A0| 3 +--<br>
=C2=A0bsd-user/main.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 4 +---<br>
=C2=A0bsd-user/strace.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 1 -<br>
=C2=A0bsd-user/x86_64/signal.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 +<br>
=C2=A0bsd-user/x86_64/target_arch_cpu.c | 3 +--<br>
=C2=A011 files changed, 9 insertions(+), 13 deletions(-)<br>
<br>
diff --git a/bsd-user/bsd-proc.h b/bsd-user/bsd-proc.h<br>
index 68b66e571d..a1061bffb8 100644<br>
--- a/bsd-user/bsd-proc.h<br>
+++ b/bsd-user/bsd-proc.h<br>
@@ -20,11 +20,7 @@<br>
=C2=A0#ifndef BSD_PROC_H_<br>
=C2=A0#define BSD_PROC_H_<br>
<br>
-#include &lt;sys/types.h&gt;<br>
-#include &lt;sys/stat.h&gt;<br>
-#include &lt;sys/time.h&gt;<br>
=C2=A0#include &lt;sys/resource.h&gt;<br></blockquote><div><br></div><div>D=
id you test this on FreeBSD 12? FreeBSD 13 has started to climb the hill wh=
ere all includes are independent, but much of that hasn&#39;t been merged t=
o 12 yet. sys/types.h, at least, is documented as a prereq for both sys/sta=
t.h and sys/resource.h.</div><div><br></div><div>I know many of these are i=
n os-dep.h, and I&#39;ve had trouble in the bsd-user fork with that and the=
 layout of the code which has arguably way too much in the .h files.</div><=
div><br></div><div>Also, why didn&#39;t you move sys/resource.h and other s=
uch files to os-dep.h? I&#39;m struggling to understand the rules around wh=
at is or isn&#39;t included where?<br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
-#include &lt;unistd.h&gt;<br>
<br>
=C2=A0/* exit(2) */<br>
=C2=A0static inline abi_long do_bsd_exit(void *cpu_env, abi_long arg1)<br>
diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h<br>
index be6105385e..0ceecfb6df 100644<br>
--- a/bsd-user/qemu.h<br>
+++ b/bsd-user/qemu.h<br>
@@ -17,7 +17,6 @@<br>
=C2=A0#ifndef QEMU_H<br>
=C2=A0#define QEMU_H<br>
<br>
-#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;exec/cpu_ldst.h&quot;<br>
diff --git a/bsd-user/arm/signal.c b/bsd-user/arm/signal.c<br>
index 2b1dd745d1..9734407543 100644<br>
--- a/bsd-user/arm/signal.c<br>
+++ b/bsd-user/arm/signal.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/bsd-user/arm/target_arch_cpu.c b/bsd-user/arm/target_arch_cpu.=
c<br>
index 02bf9149d5..fe38ae2210 100644<br>
--- a/bsd-user/arm/target_arch_cpu.c<br>
+++ b/bsd-user/arm/target_arch_cpu.c<br>
@@ -16,6 +16,8 @@<br>
=C2=A0 *=C2=A0 You should have received a copy of the GNU General Public Li=
cense<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;target_arch.h&quot;<br>
<br>
=C2=A0void target_cpu_set_tls(CPUARMState *env, target_ulong newtls)<br>
diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c<br>
index 309e27b9d6..1676ec10f8 100644<br>
--- a/bsd-user/freebsd/os-sys.c<br>
+++ b/bsd-user/freebsd/os-sys.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;target_arch_sysarch.h&quot;<br>
<br>
diff --git a/bsd-user/i386/signal.c b/bsd-user/i386/signal.c<br>
index 5dd975ce56..a3131047b8 100644<br>
--- a/bsd-user/i386/signal.c<br>
+++ b/bsd-user/i386/signal.c<br>
@@ -17,6 +17,7 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/bsd-user/i386/target_arch_cpu.c b/bsd-user/i386/target_arch_cp=
u.c<br>
index d349e45299..2a3af2ddef 100644<br>
--- a/bsd-user/i386/target_arch_cpu.c<br>
+++ b/bsd-user/i386/target_arch_cpu.c<br>
@@ -17,9 +17,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
-#include &lt;sys/types.h&gt;<br>
-<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br>
diff --git a/bsd-user/main.c b/bsd-user/main.c<br>
index 6f09180d65..41290e16f9 100644<br>
--- a/bsd-user/main.c<br>
+++ b/bsd-user/main.c<br>
@@ -18,12 +18,10 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
-#include &lt;sys/types.h&gt;<br>
-#include &lt;sys/time.h&gt;<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &lt;sys/resource.h&gt;<br>
=C2=A0#include &lt;sys/sysctl.h&gt;<br>
<br>
-#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu/help-texts.h&quot;<br>
=C2=A0#include &quot;qemu/units.h&quot;<br>
=C2=A0#include &quot;qemu/accel.h&quot;<br>
diff --git a/bsd-user/strace.c b/bsd-user/strace.c<br>
index a77d10dd6b..96499751eb 100644<br>
--- a/bsd-user/strace.c<br>
+++ b/bsd-user/strace.c<br>
@@ -20,7 +20,6 @@<br>
=C2=A0#include &lt;sys/select.h&gt;<br>
=C2=A0#include &lt;sys/syscall.h&gt;<br>
=C2=A0#include &lt;sys/ioccom.h&gt;<br>
-#include &lt;ctype.h&gt;<br>
<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
diff --git a/bsd-user/x86_64/signal.c b/bsd-user/x86_64/signal.c<br>
index c3875bc4c6..46cb865180 100644<br>
--- a/bsd-user/x86_64/signal.c<br>
+++ b/bsd-user/x86_64/signal.c<br>
@@ -16,6 +16,7 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
+#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
<br>
=C2=A0/*<br>
diff --git a/bsd-user/x86_64/target_arch_cpu.c b/bsd-user/x86_64/target_arc=
h_cpu.c<br>
index be7bd10720..1d32f18907 100644<br>
--- a/bsd-user/x86_64/target_arch_cpu.c<br>
+++ b/bsd-user/x86_64/target_arch_cpu.c<br>
@@ -17,9 +17,8 @@<br>
=C2=A0 *=C2=A0 along with this program; if not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
=C2=A0 */<br>
<br>
-#include &lt;sys/types.h&gt;<br>
-<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+<br>
=C2=A0#include &quot;cpu.h&quot;<br>
=C2=A0#include &quot;qemu.h&quot;<br>
=C2=A0#include &quot;qemu/timer.h&quot;<br></blockquote><div><br></div><div=
>I suppose these are fine. How do I run the cleanup script? I have 2x the n=
umber of files not upstream in the bsd-user fork that I&#39;d like to clean=
up as well and they are likely a bigger mess and I&#39;ll just upstream the=
m in the messy state unless I understand how to keep the neat :).<br></div>=
<div><br></div><div>Warner <br></div></div></div>

--000000000000763fdf05f29ef11f--

