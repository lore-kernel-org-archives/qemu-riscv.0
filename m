Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k09NT-0001AK-RG
	for mharc-qemu-riscv@gnu.org; Mon, 27 Jul 2020 16:05:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k09NR-000182-K4; Mon, 27 Jul 2020 16:05:37 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:35889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1k09NP-0006Vd-Ng; Mon, 27 Jul 2020 16:05:37 -0400
Received: by mail-io1-xd44.google.com with SMTP id t15so9401588iob.3;
 Mon, 27 Jul 2020 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RBXEKNehhjZblUJAq0gpTf2XSjuahZh1jvHMhHX1XJU=;
 b=i69LkMvoDyjDUTL90zVw9sa5wXa29eBWc1ss7+qhQtNKbrrDLjIjR36LUr++oGYfHM
 33JQs3Yt//FTYixGxsQ4YSjdTBlxxtxq8ABb3lCyg/fbZwveQ/haa/H9E5zZeX0BBLhW
 l3h+ClyHHA07lcdtolrWcmeS5xEnupen5bpcVnWL8nccr7/18a8QVRS37RadVULNaRr6
 PGlPnirHBBl44577z/HZSWhmxv806rfxd7ngtOXX/5UbqImzGuo9exGmmLY7oy4mpZ9T
 bEmwhWo43FOfEl7/Abm9eZqwVOEohzH/TYvS9yuzPIkGqZ0l1Bkh6YG0tO/gFFvJcMMG
 3ABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RBXEKNehhjZblUJAq0gpTf2XSjuahZh1jvHMhHX1XJU=;
 b=VKw1Lnsl4QAiErFtdepMUPefZWpb4kd0tBgk9VSqvO9hQWnoUFqFkcJFIXjVs2Aw3M
 T/0xGymLB7nMDoRbVIzCZdQDKMwRe+oOW72bLKzVxbOeNb2bgzu3+HGCF1S+s/N2jdyK
 gtk96qxQMPYNF9x4CPVidpox8OxGVxpZbdWYwIPc5aWmCWQZMvpz6MYTVUxTMiJQ019p
 fCNwE5KORILcJNbhJcgIA1+T6QyscbG67ofU6Zw0iYcNDNq2hLndreAZySO1HjM4rGTS
 IBKVH/OQ8dWjcDCdtK60Zwpz/BivZ4Fsr+B0+tcGBBUx8V1WVmF7gVcwj3SQq0452QU8
 BKDQ==
X-Gm-Message-State: AOAM532GuCodf2mgwj9zZUvqI2755v0W5OCpFdNuUW/YirYw8brDOVX+
 Ahz1+Gi1Zb2XNPssrRYF5j8TkZt7C9XNhJoR7pk=
X-Google-Smtp-Source: ABdhPJx9HNJ8AKZ8Q5Mrpqi7uGzuC3xlvpxOxrsNvl/loDgV8WxA4Np4Xbz5aM3PzShJrnp/PDAYRjRY+oxdvisZY6M=
X-Received: by 2002:a02:10c1:: with SMTP id 184mr27758532jay.135.1595880333732; 
 Mon, 27 Jul 2020 13:05:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200722091641.8834-2-frank.chang@sifive.com>
 <mhng-0246b27e-f392-45a9-806e-9998bb5ede5e@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-0246b27e-f392-45a9-806e-9998bb5ede5e@palmerdabbelt-glaptop1>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 27 Jul 2020 12:55:18 -0700
Message-ID: <CAKmqyKMEraiyw_r7U3v8K-2pdipBh3otaPOaNPLKtpvqPe780A@mail.gmail.com>
Subject: Re: [RFC v2 01/76] target/riscv: drop vector 0.7.1 support
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Frank Chang <frank.chang@sifive.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Sagar Karandikar <sagark@eecs.berkeley.edu>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d44;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Mon, 27 Jul 2020 20:05:37 -0000

On Mon, Jul 27, 2020 at 12:54 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 22 Jul 2020 02:15:24 PDT (-0700), frank.chang@sifive.com wrote:
> > From: Frank Chang <frank.chang@sifive.com>
> >
> > Signed-off-by: Frank Chang <frank.chang@sifive.com>
> > ---
> >  target/riscv/cpu.c | 24 ++++++------------------
> >  target/riscv/cpu.h |  2 --
> >  2 files changed, 6 insertions(+), 20 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 228b9bdb5d..2800953e6c 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -106,11 +106,6 @@ static void set_priv_version(CPURISCVState *env, int priv_ver)
> >      env->priv_ver = priv_ver;
> >  }
> >
> > -static void set_vext_version(CPURISCVState *env, int vext_ver)
> > -{
> > -    env->vext_ver = vext_ver;
> > -}
> > -
> >  static void set_feature(CPURISCVState *env, int feature)
> >  {
> >      env->features |= (1ULL << feature);
> > @@ -339,7 +334,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >      CPURISCVState *env = &cpu->env;
> >      RISCVCPUClass *mcc = RISCV_CPU_GET_CLASS(dev);
> >      int priv_version = PRIV_VERSION_1_11_0;
> > -    int vext_version = VEXT_VERSION_0_07_1;
> >      target_ulong target_misa = 0;
> >      Error *local_err = NULL;
> >
> > @@ -363,7 +357,6 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >      }
> >
> >      set_priv_version(env, priv_version);
> > -    set_vext_version(env, vext_version);
> >
> >      if (cpu->cfg.mmu) {
> >          set_feature(env, RISCV_FEATURE_MMU);
> > @@ -455,19 +448,14 @@ static void riscv_cpu_realize(DeviceState *dev, Error **errp)
> >                  return;
> >              }
> >              if (cpu->cfg.vext_spec) {
> > -                if (!g_strcmp0(cpu->cfg.vext_spec, "v0.7.1")) {
> > -                    vext_version = VEXT_VERSION_0_07_1;
> > -                } else {
> > -                    error_setg(errp,
> > -                           "Unsupported vector spec version '%s'",
> > -                           cpu->cfg.vext_spec);
> > -                    return;
> > -                }
> > +                error_setg(errp,
> > +                       "Unsupported vector spec version '%s'",
> > +                       cpu->cfg.vext_spec);
> > +                return;
> >              } else {
> > -                qemu_log("vector verison is not specified, "
> > -                        "use the default value v0.7.1\n");
> > +                qemu_log("vector version is not specified\n");
> > +                return;
> >              }
> > -            set_vext_version(env, vext_version);
> >          }
> >
> >          set_misa(env, RVXLEN | target_misa);
> > diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> > index eef20ca6e5..6766dcd914 100644
> > --- a/target/riscv/cpu.h
> > +++ b/target/riscv/cpu.h
> > @@ -79,8 +79,6 @@ enum {
> >  #define PRIV_VERSION_1_10_0 0x00011000
> >  #define PRIV_VERSION_1_11_0 0x00011100
> >
> > -#define VEXT_VERSION_0_07_1 0x00000701
> > -
> >  #define TRANSLATE_PMP_FAIL 2
> >  #define TRANSLATE_FAIL 1
> >  #define TRANSLATE_SUCCESS 0
>
> If I'm reading things correctly, 5.0 did not have the V extension.  This means
> that we can technically drop 0.7.1 from QEMU, as it's never been released.

There is no intention of this making it into 5.1. We are currently in
hard freeze.

The idea is that QEMU 5.1 will support v0.7.1 and then hopefully 5.2
will support v0.9.

> That said, I'd still prefer to avoid dropping 0.7.1 so late in the release
> cycle (it's already soft freeze, right?).  Given the extended length of the V
> extension development process it seems likely that 0.7.1 is going to end up in
> some silicon, which means it would be quite useful to have it in QEMU.

Agreed!

>
> I understand it's a lot more work to maintain multiple vector extensions, but
> it was very useful to have multiple privileged extensions supported in QEMU
> while that was all getting sorted out and as the vector drafts has massive
> differences it'll probably be even more useful.

Hopefully a release will be enough for this as managing both will be a
huge maintenance burden.

Alistair

>

