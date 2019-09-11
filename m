Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i846j-0000TS-Hg
	for mharc-qemu-riscv@gnu.org; Wed, 11 Sep 2019 11:00:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49165)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chihmin.chao@sifive.com>) id 1i846f-0000QE-Gd
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:00:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <chihmin.chao@sifive.com>) id 1i846d-0003UY-Iu
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:00:28 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:36204)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <chihmin.chao@sifive.com>)
 id 1i846d-0003UG-Dj
 for qemu-riscv@nongnu.org; Wed, 11 Sep 2019 11:00:27 -0400
Received: by mail-io1-xd41.google.com with SMTP id b136so46569133iof.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Sep 2019 08:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A4W+uwqmFQL3Fl94MJldRvkiHT0JnYIMySqsIaI9inc=;
 b=c/2EyqVRC7TV1AsCB5wxrkYVp9fJkvaq63AXcQwHdbvrVEjyzkudfqvDd48wwi8QVT
 NOw38ZbBO7ySUEM5DA+dtyrEDYGbrPCUH/b2U8ucFmTUUIfeW93Y63gq6blbB8l9ZXXA
 6RQVAae0VJeJGMLM9NCs8N9lpPuNu+Ipq1ZkS1G6RQds7Tsn3APnuUMgVjVoWjj6cQ6o
 BmET3nQwUJPSeFxaHf+gEDdQfmpXvdrfDq2fehslJ7LvOa9kXgCTrN/AyrCUGvOu+cGI
 ptfaXcN1klB5VW0f3vxrrVilkR5t2TDWRXcS+isRc7dUsQ3cHN4Drc6XU9cDGp6H2rtl
 2ztw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A4W+uwqmFQL3Fl94MJldRvkiHT0JnYIMySqsIaI9inc=;
 b=XzYPII4gRYwFlTtNhqXZctBGuFsr5BGuIzsG3EWhkZU8nptp7M5i97F3+SYshWjUxh
 niHpRz91NEAaCgkAAuWGTlx9bkvKrjgg2V97IEoB8XL5gYm0hWoUEzkndhcXpoeUEW7f
 n2Is3wWT+3aJhw3++D6asfDTAYBgg7MlnmidMkHgf6DGYq0aR8ap/KkpCEqCcvR/tLbz
 wVZQRk/m/mzoZolfLXBBg0rrAQqHQF1sdR+ooDRX+5ktUZp9OUzaJubvDlMUSfD+dgD8
 hLsctsz1/5DcrcTAURvlfgWh4K/DfC30b87zI/WUi8DfToHM4ofg2gYARbRD/XQg2OBV
 EGqQ==
X-Gm-Message-State: APjAAAULysS2hQDWrX5roIn9ScfAr3YejYxKTt7C8euj2kXZN0dG4H0Q
 T60zR/gAiLf2hloFGyAU6HgS4QZmi0lB84YZ+AGRPw==
X-Google-Smtp-Source: APXvYqw54930mTdOMUZckpG8BtuhYzYbJxtjN1ywoyTeKEmtG0hV4gIW7yh/ddeQqoTvY7gtWLvaTlYDQKEXhjDXRHE=
X-Received: by 2002:a02:170a:: with SMTP id 10mr10463458jah.65.1568214025709; 
 Wed, 11 Sep 2019 08:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <1568183141-67641-1-git-send-email-zhiwei_liu@c-sky.com>
 <1568183141-67641-3-git-send-email-zhiwei_liu@c-sky.com>
In-Reply-To: <1568183141-67641-3-git-send-email-zhiwei_liu@c-sky.com>
From: Chih-Min Chao <chihmin.chao@sifive.com>
Date: Wed, 11 Sep 2019 23:00:15 +0800
Message-ID: <CAEiOBXUE4-gq1850=LXj5sWyy=b6JgoKNiVr3LEN-+e8rqbjUg@mail.gmail.com>
To: liuzhiwei <zhiwei_liu@c-sky.com>
Cc: Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, riku.voipio@iki.fi,
 laurent@vivier.eu, 
 wenmeng_zhang@c-sky.com, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 wxy194768@alibaba-inc.com
Content-Type: multipart/alternative; boundary="000000000000ef4e5205924847e0"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH v2 02/17] RISC-V: turn on
 vector extension from command line by cfg.ext_v Property
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2019 15:00:31 -0000

--000000000000ef4e5205924847e0
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 11, 2019 at 2:36 PM liuzhiwei <zhiwei_liu@c-sky.com> wrote:

> From: LIU Zhiwei <zhiwei_liu@c-sky.com>
>
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.c | 6 +++++-
>  target/riscv/cpu.h | 2 ++
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index f8d07bd..9f93ce7 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -109,7 +109,7 @@ static void set_resetvec(CPURISCVState *env, int
> resetvec)
>  static void riscv_any_cpu_init(Object *obj)
>  {
>      CPURISCVState *env = &RISCV_CPU(obj)->env;
> -    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU);
> +    set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | RVU | RVV);
>      set_priv_version(env, PRIV_VERSION_1_11_0);
>      set_resetvec(env, DEFAULT_RSTVEC);
>  }
> @@ -406,6 +406,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error
> **errp)
>          if (cpu->cfg.ext_u) {
>              target_misa |= RVU;
>          }
> +        if (cpu->cfg.ext_v) {
> +            target_misa |= RVV;
> +        }
>
>          set_misa(env, RVXLEN | target_misa);
>      }
> @@ -441,6 +444,7 @@ static Property riscv_cpu_properties[] = {
>      DEFINE_PROP_BOOL("c", RISCVCPU, cfg.ext_c, true),
>      DEFINE_PROP_BOOL("s", RISCVCPU, cfg.ext_s, true),
>      DEFINE_PROP_BOOL("u", RISCVCPU, cfg.ext_u, true),
> +    DEFINE_PROP_BOOL("v", RISCVCPU, cfg.ext_v, true),
>      DEFINE_PROP_BOOL("Counters", RISCVCPU, cfg.ext_counters, true),
>      DEFINE_PROP_BOOL("Zifencei", RISCVCPU, cfg.ext_ifencei, true),
>      DEFINE_PROP_BOOL("Zicsr", RISCVCPU, cfg.ext_icsr, true),
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index c992b1d..2c7072a 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -67,6 +67,7 @@
>  #define RVC RV('C')
>  #define RVS RV('S')
>  #define RVU RV('U')
> +#define RVV RV('V')
>
>  /* S extension denotes that Supervisor mode exists, however it is possible
>     to have a core that support S mode but does not have an MMU and there
> @@ -250,6 +251,7 @@ typedef struct RISCVCPU {
>          bool ext_c;
>          bool ext_s;
>          bool ext_u;
> +        bool ext_v;
>          bool ext_counters;
>          bool ext_ifencei;
>          bool ext_icsr;
> --
> 2.7.4
>
>
> Reviewed-by: Chih-Min Chao <chihmin.chao@sifive.com>

--000000000000ef4e5205924847e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 11, 2019 at 2:36 PM liuzh=
iwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com">zhiwei_liu@c-sky.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" target=3D"_blank">zh=
iwei_liu@c-sky.com</a>&gt;<br>
<br>
Signed-off-by: LIU Zhiwei &lt;<a href=3D"mailto:zhiwei_liu@c-sky.com" targe=
t=3D"_blank">zhiwei_liu@c-sky.com</a>&gt;<br>
---<br>
=C2=A0target/riscv/cpu.c | 6 +++++-<br>
=C2=A0target/riscv/cpu.h | 2 ++<br>
=C2=A02 files changed, 7 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c<br>
index f8d07bd..9f93ce7 100644<br>
--- a/target/riscv/cpu.c<br>
+++ b/target/riscv/cpu.c<br>
@@ -109,7 +109,7 @@ static void set_resetvec(CPURISCVState *env, int resetv=
ec)<br>
=C2=A0static void riscv_any_cpu_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0CPURISCVState *env =3D &amp;RISCV_CPU(obj)-&gt;env;<br>
-=C2=A0 =C2=A0 set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | R=
VU);<br>
+=C2=A0 =C2=A0 set_misa(env, RVXLEN | RVI | RVM | RVA | RVF | RVD | RVC | R=
VU | RVV);<br>
=C2=A0 =C2=A0 =C2=A0set_priv_version(env, PRIV_VERSION_1_11_0);<br>
=C2=A0 =C2=A0 =C2=A0set_resetvec(env, DEFAULT_RSTVEC);<br>
=C2=A0}<br>
@@ -406,6 +406,9 @@ static void riscv_cpu_realize(DeviceState *dev, Error *=
*errp)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cpu-&gt;cfg.ext_u) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target_misa |=3D RVU;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (cpu-&gt;cfg.ext_v) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 target_misa |=3D RVV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set_misa(env, RVXLEN | target_misa);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -441,6 +444,7 @@ static Property riscv_cpu_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;c&quot;, RISCVCPU, cfg.ext_c, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;s&quot;, RISCVCPU, cfg.ext_s, tr=
ue),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;u&quot;, RISCVCPU, cfg.ext_u, tr=
ue),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;v&quot;, RISCVCPU, cfg.ext_v, true),<=
br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Counters&quot;, RISCVCPU, cfg.ex=
t_counters, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zifencei&quot;, RISCVCPU, cfg.ex=
t_ifencei, true),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_BOOL(&quot;Zicsr&quot;, RISCVCPU, cfg.ext_i=
csr, true),<br>
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h<br>
index c992b1d..2c7072a 100644<br>
--- a/target/riscv/cpu.h<br>
+++ b/target/riscv/cpu.h<br>
@@ -67,6 +67,7 @@<br>
=C2=A0#define RVC RV(&#39;C&#39;)<br>
=C2=A0#define RVS RV(&#39;S&#39;)<br>
=C2=A0#define RVU RV(&#39;U&#39;)<br>
+#define RVV RV(&#39;V&#39;)<br>
<br>
=C2=A0/* S extension denotes that Supervisor mode exists, however it is pos=
sible<br>
=C2=A0 =C2=A0 to have a core that support S mode but does not have an MMU a=
nd there<br>
@@ -250,6 +251,7 @@ typedef struct RISCVCPU {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_c;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_s;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_u;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool ext_v;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_counters;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_ifencei;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bool ext_icsr;<br>
-- <br>
2.7.4<br>
<br>
<br></blockquote><div>Reviewed-by: Chih-Min Chao &lt;<a href=3D"mailto:chih=
min.chao@sifive.com" target=3D"_blank">chihmin.chao@sifive.com</a>&gt;=C2=
=A0=C2=A0</div></div></div>

--000000000000ef4e5205924847e0--

