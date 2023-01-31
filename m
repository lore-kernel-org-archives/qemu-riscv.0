Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMlX7-0005lv-9d
	for mharc-qemu-riscv@gnu.org; Tue, 31 Jan 2023 02:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMlX1-0005k1-K9; Tue, 31 Jan 2023 02:58:20 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <geomatsi@gmail.com>)
 id 1pMlWz-0002Qe-Dl; Tue, 31 Jan 2023 02:58:19 -0500
Received: by mail-ej1-x632.google.com with SMTP id p26so27906221ejx.13;
 Mon, 30 Jan 2023 23:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yE1SDRPNQvKDzunWv7Z/9APPN2vtX0zkGAvX41ENnyo=;
 b=XmJVzBfSyrxQ1zEOyeHXEILpIYGRovM1d3npD+00XQw5z46oElPpfH/Z4Un6vYOuyl
 UAvu6ubGT4YU0xRZLaqa4AgbsnuYjWVgRv8vXK2Z5re+aeVCbFX3csE2IreWzd900sf1
 oZQkcOj5Rh24NWbK5/nwiBWN7oj62iEIH01KCdbM0dpDazi9mKfcHcOQp+L8hec99MiO
 ZREf4Q1M2oyvsKUP216lFLIlGVlNxbqqhP7IObbrKLKghSVBoYMOsxYjMlM4/5sPp8TK
 SBf8Z67yd8Dhaigrz6PXll9AjdhDHp5vvHnL+GCjzXgsJ0pqBamjMf9NWSEnnf99KcRU
 YY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yE1SDRPNQvKDzunWv7Z/9APPN2vtX0zkGAvX41ENnyo=;
 b=1xaUqPyUYsrLVrCmuNon8T9pnbL3sCC6R8PR5XeH/8GqhA4YeLvy0PuAucEgTiCMRQ
 72pG8TFTDOwKy667RB8CInnOBS2Y/Q1J2qEs+maAMP9PMxGyNMz3GW7NoMVe/FlJubKB
 xJciuTFERcTwwZZgmxEjJkdb+ejVXSPpanRwfC/AItPHTpcUhwzaaf8K4mksYI7AZ8la
 suqiEBf1ydEU731luaKbaaxC1Mq0213fFDflNwRL5qXQE8jN1i8prGskebMIqF1xZRJ8
 DnBvS4ELObaotp+taEwekactUNNFj5eY/fg79DRksTflRH7fpYdVVqR9+h6FDqZQ1kOL
 FLGA==
X-Gm-Message-State: AO0yUKXU4E/16Ava5hCM2la/9za1D1b90vVi6Bw1//K+9bvWHs2h6nX8
 MA/AYlCgyMmQQx+tXsimFeM=
X-Google-Smtp-Source: AK7set8FQiKx9PyqqRBGpJSwLkvvSYnDZTMshNoji8lnxnTWkMZgd62rr5xZ9bYCka32e9QjHRGMTg==
X-Received: by 2002:a17:906:411:b0:88b:23bb:e61f with SMTP id
 d17-20020a170906041100b0088b23bbe61fmr3389222eja.25.1675151894622; 
 Mon, 30 Jan 2023 23:58:14 -0800 (PST)
Received: from curiosity ([80.211.22.60]) by smtp.gmail.com with ESMTPSA id
 e18-20020a17090681d200b0088519b92080sm4190546ejx.127.2023.01.30.23.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 23:58:13 -0800 (PST)
Date: Tue, 31 Jan 2023 10:58:09 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Alistair Francis <alistair23@gmail.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH] target/riscv: set tval for triggered watchpoints
Message-ID: <Y9jKEZgzb+yp5cVE@curiosity>
References: <20230130100757.721372-1-geomatsi@gmail.com>
 <CAKmqyKMiP9N8CX844++qb+dFFn46Peic87P7-5dJrRfLAyM4wA@mail.gmail.com>
 <CAEUhbmXa=P+JCB3+JnzTdkWdqTZFr9NZR58uEzjK=Pz3ohLD4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUhbmXa=P+JCB3+JnzTdkWdqTZFr9NZR58uEzjK=Pz3ohLD4A@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=geomatsi@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 31 Jan 2023 07:58:20 -0000

Hi Bin,

> > > According to priviledged spec, if [sm]tval is written with a nonzero
> > > value when a breakpoint exception occurs, then [sm]tval will contain
> > > the faulting virtual address. Set tval to hit address when breakpoint
> > > exception is triggered by hardware watchpoint.
> > >
> > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> >
> > Thanks!
> >
> > Applied to riscv-to-apply.next
> 
> Oops, too quick, but I have one comment :)
> 
> >
> > Alistair
> >
> > > ---
> > >  target/riscv/cpu_helper.c | 3 +++
> > >  target/riscv/debug.c      | 1 +
> > >  2 files changed, 4 insertions(+)
> > >
> > > diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
> > > index 9a28816521..d3be8c0511 100644
> > > --- a/target/riscv/cpu_helper.c
> > > +++ b/target/riscv/cpu_helper.c
> > > @@ -1641,6 +1641,9 @@ void riscv_cpu_do_interrupt(CPUState *cs)
> > >          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
> > >              tval = env->bins;
> > >              break;
> > > +        case RISCV_EXCP_BREAKPOINT:
> > > +            tval = env->badaddr;
> 
> RISCV_EXCP_BREAKPOINT may come from 'ebreak' so we should test if this
> exception comes from the debug module.
> 
> The spec also says about icount trigger that:
> 
> "If the trigger fires with action =0 then zero is written to the tval
> CSR on the breakpoint trap."
> 
> So we can't blindly set tval for every breakpoint exception.
> 

Thanks for catching ! Initial idea was to set badaddr value only when
it is needed in target/riscv/debug.c. For instance, icount code does
not set badaddr, so tval will remain zero. On the other hand, breakpoint
exception may come from ebreak and badaddr may keep non-zero value from
some previous unrelated exception.

Explicit check should be more safe, e.g. something like that:

diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
index d3be8c0511..f1a0c65ad3 100644
--- a/target/riscv/cpu_helper.c
+++ b/target/riscv/cpu_helper.c
@@ -1642,7 +1642,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
             tval = env->bins;
             break;
         case RISCV_EXCP_BREAKPOINT:
-            tval = env->badaddr;
+            if (cs->watchpoint_hit) {
+                tval = cs->watchpoint_hit->hitaddr;
+                cs->watchpoint_hit = NULL;
+            }
             break;
         default:
             break;
diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index 48ef3c59ea..b091293069 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -761,8 +761,6 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
 
     if (cs->watchpoint_hit) {
         if (cs->watchpoint_hit->flags & BP_CPU) {
-            env->badaddr = cs->watchpoint_hit->hitaddr;
-            cs->watchpoint_hit = NULL;
             do_trigger_action(env, DBG_ACTION_BP);
         }
     } else {


I will a fixup after testing.

Regards,
Sergey

