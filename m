Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jeNC4-0006AH-Bv
	for mharc-qemu-riscv@gnu.org; Thu, 28 May 2020 14:23:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jeNC1-000691-UO; Thu, 28 May 2020 14:23:50 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:46521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1jeNC0-0001X4-Hr; Thu, 28 May 2020 14:23:49 -0400
Received: by mail-io1-xd42.google.com with SMTP id j8so31102879iog.13;
 Thu, 28 May 2020 11:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qQGB5g2hk1kP9Tan4ZK2pJApSMT2HZ16zkH84c3mepM=;
 b=oYg1KMS6vZD4lzClB5FwOIR0t2nh4GcDT6CiRGwMEFEOat3n2ZxQJBve0t2LCe0Oe5
 TUwJuNOccT9sX+8vV265O/YZPF0epefmq5iB0OF21NQmboEVuxcDnl6gxiebqJN6FUan
 yskQ0hsZUaUV1t/G/DrdBI1dl5AWFssdg4mS7cAfrCrPiR78xsPZ8jGWu55l1JzylWOn
 ILFLulXmxn+BuWGG/GAoxk/VwIvI/Hn5tK+6L0HxC5jVVYyIHdvtqORbnlQaNfQofy16
 oa7kVdHRnRpFyFs1C2CcxHWUGwNWusB2jiK+l34unvWE0becOqNBSql49WOp5hlZTytk
 3lJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qQGB5g2hk1kP9Tan4ZK2pJApSMT2HZ16zkH84c3mepM=;
 b=cxV6oZVY7hFXuxueJCF2Xn24Vt2k1CDxDpBJIsFnHmODv9oo5y+c4DyucZGwSPC4Qy
 CANnJiFNfUqFdkm7wYBQqXHWWvMefH1aqkbJnyEocEPiJtUTSHr40SHOosVpsLjR+GYs
 +DaIbQaUGXKOvA38fqOU50JSt5gj/kz6jmSwhMNfGFkcNck8dQNf3bWpKHdMkXYwMejC
 waY8oCWCqkqw6rCTqtY1bYTR0VfbYJSy2wd1Z0GmbsW9YXelOpw1RL5tYyqJuA0A0awT
 CSfHbAPfjeg+1BhF4GTyMYKvPYgjdAAv7eCFG9/xWNEEgUDGXeuN9iK4jeSuf9W/7Ryd
 W6CQ==
X-Gm-Message-State: AOAM533Ia9WhLzMUxJvCHxdiC1c4qQJxMJeUKNqhJNaEBAFhWLjhS9NA
 4evv+HUPDMnaAUzURC7hxGjW1uP9CtMZaFjpOPQ=
X-Google-Smtp-Source: ABdhPJx4ukStFwD716T36m7k+Uz5lkJKdiAnUL+rA+J5JUBDES+DYIpEnSiWdtBm/IqwkalfoX7nYcS9xdiG23/aX/w=
X-Received: by 2002:a5d:9cc2:: with SMTP id w2mr3480120iow.42.1590690225859;
 Thu, 28 May 2020 11:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590598125.git.alistair.francis@wdc.com>
 <756439d4816fb3bd7ef84b458bdb6ab3442cdeac.1590598125.git.alistair.francis@wdc.com>
 <CAEUhbmV5Y6xuushwx2QEzdjHgvZA2kov4pakG5BgEXn4is=_=w@mail.gmail.com>
In-Reply-To: <CAEUhbmV5Y6xuushwx2QEzdjHgvZA2kov4pakG5BgEXn4is=_=w@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 28 May 2020 11:14:44 -0700
Message-ID: <CAKmqyKPB8Q7rd1NBS0kR=bFfno+DkzaNvri+eWF=_B0XjMTaug@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] target/riscv: Disable the MMU correctly
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d42;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 28 May 2020 18:23:51 -0000

On Wed, May 27, 2020 at 7:32 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, May 28, 2020 at 12:58 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> >
> > Previously if we didn't enable the MMU it would be enabled in the
> > realize() function anyway. Let's ensure that if we don't want the MMU we
> > disable it. We also don't need to enable the MMU as it will be enalbed
> > in realize() by default.
> >
>
> I think we should do the same for the PMP feature as the logic is the
> same as MMU: PMP is always enabled in the realize() function

Done!

Alistair

>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  target/riscv/cpu.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > index 5eb3c02735..8deba3d16d 100644
> > --- a/target/riscv/cpu.c
> > +++ b/target/riscv/cpu.c
> > @@ -142,7 +142,6 @@ static void rv32gcsu_priv1_09_1_cpu_init(Object *obj)
> >      set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_09_1);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > -    set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> >  }
> >
> > @@ -152,7 +151,6 @@ static void rv32gcsu_priv1_10_0_cpu_init(Object *obj)
> >      set_misa(env, RV32 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > -    set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> >  }
> >
> > @@ -163,6 +161,7 @@ static void rv32imacu_nommu_cpu_init(Object *obj)
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> >  }
> >
> >  static void rv32imafcu_nommu_cpu_init(Object *obj)
> > @@ -172,6 +171,7 @@ static void rv32imafcu_nommu_cpu_init(Object *obj)
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> >  }
> >
> >  #elif defined(TARGET_RISCV64)
> > @@ -190,7 +190,6 @@ static void rv64gcsu_priv1_09_1_cpu_init(Object *obj)
> >      set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_09_1);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > -    set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> >  }
> >
> > @@ -200,7 +199,6 @@ static void rv64gcsu_priv1_10_0_cpu_init(Object *obj)
> >      set_misa(env, RV64 | RVI | RVM | RVA | RVF | RVD | RVC | RVS | RVU);
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> > -    set_feature(env, RISCV_FEATURE_MMU);
> >      set_feature(env, RISCV_FEATURE_PMP);
> >  }
> >
> > @@ -211,6 +209,7 @@ static void rv64imacu_nommu_cpu_init(Object *obj)
> >      set_priv_version(env, PRIV_VERSION_1_10_0);
> >      set_resetvec(env, DEFAULT_RSTVEC);
> >      set_feature(env, RISCV_FEATURE_PMP);
> > +    qdev_prop_set_bit(DEVICE(obj), "mmu", false);
> >  }
> >
>
> Regards,
> Bin

