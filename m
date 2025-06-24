Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E5AC77B7F
	for <qemu-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 13:49:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1uU40w-0004AN-8q; Tue, 24 Jun 2025 09:48:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uU40u-0004AA-AV
 for qemu-riscv@nongnu.org; Tue, 24 Jun 2025 09:48:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rkrcmar@ventanamicro.com>)
 id 1uU40n-0006IP-B2
 for qemu-riscv@nongnu.org; Tue, 24 Jun 2025 09:48:38 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a577f164c8so734485f8f.2
 for <qemu-riscv@nongnu.org>; Tue, 24 Jun 2025 06:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1750772910; x=1751377710; darn=nongnu.org;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oQh0LlcIASE0UVGS5ATj6wATE7U30h0+xwUiq1t9xn4=;
 b=CggQRyyrQuhyZZ3cclnzZ+hqlFDt/0w/fewA3VUF9lbeDPfyH+XlN17RdM7etTUGIn
 TNrQrc7sjJZQl3RiKRongTInHLGqcYfG1AR92jOlu53lUQZvwZhCLRNmNZ3v6fHD6TAB
 C08cpfcMj9V+zu39o6HP7DkGHSa3KoKRNRI0NFR3DAnmcDWfCsiNGZSIo7UCe1jYil5h
 fzmlO6s24mMdSoBkg7KRk4hRm1G6RFgsjsZMYbum/QcGqBszf7iNX5N7qd39M7KrR4tS
 FKQH23NZ39+grNGX9iqVCeIdpQeOYvgeRccEBMUvX+KsLbDv4++es8j4JiIQpik6IFQV
 QfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750772910; x=1751377710;
 h=in-reply-to:references:subject:from:to:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=oQh0LlcIASE0UVGS5ATj6wATE7U30h0+xwUiq1t9xn4=;
 b=NHwmulk1NN/svx+nprhnTuViDZr0fjHGtmz/c3oMb1nLdhvTLhaSJLM43JQfMrNSL2
 wE83tYQSK+xY5Vt0/uA2x8Lu8e8n6KLRuoQkgD/ZYBxXbNkxEg5cHBzoL2b/ddUAVnRi
 f8w9T9HNjH63bjkwK2VrnpeOTqyGsjczC1nCQrwDfoUms7E15p3DHhfXdzvYHOcM/oFp
 NU1FzXRCl7m8VQ2h/v0AjTrxHX2ml2DvlCu7FOCap6oozc/lw7PDuo0X3GJWu6rus1R7
 xaDi8BxHO8o3IXwbuYSSdRXUIcY5+ggYoPMZpU6dgU9SlGlUwdHcqcNpQ/uGmboOEPC+
 NqFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXxWJxL04wlxC3azdvz/4uoyfv4no78R7EjK85Hqlof8Tf6r4o9K+SsM8nCIvYSBBElZkUEISbXEvcZ@nongnu.org
X-Gm-Message-State: AOJu0YwLi25I1LfGJ1UWfIXwJXrwCWzO/eDwYTfZDoXkq2f5qyEu0IQa
 1o9F2Znl0myS5PUPKC/ElNJWr/gKBPRZ+L8Cb5utMAPnQmslUi9bEe+9ZrrZbUkbrxI=
X-Gm-Gg: ASbGncsRug96ntSbZ+rNjiDbAZb4QwVEO7H7Q5UScUGWQqOmtBMiPtuMI9sNMlrLXRR
 Am4hU/3yV9RkIyuJfjycaGvNoswYFzVEhUcpUTA2okv2CclIaEgqzr9Du2NiAIZzERSmuHXIKVp
 jgYwkKhlYJUGnTURXa/VubMGoxmiRJuuPLxHEFoR+IVmZdd4qZRCrEVRzOJDYHC12z6F6Y2qvi5
 OPe+GbT/x3ldw2UfYL3NGUmsIT/XJMha3abdmT17aB0FTlGDV7InshvbyQ+XoepV1Bb1sMj3B8F
 WC5mI5F7HKeaOtEe84Uoh71aEqqVhE0nI6WfLcq3bYFsGiBnTsAHEbNaE5iYKOSqrWdN/g==
X-Google-Smtp-Source: AGHT+IHHmAO172oI5BDXvSqP2mtdoG217AFPRQ7fatu+5vXhdtcKvbW+ExYK5OMJHwWlHR5xTawQHA==
X-Received: by 2002:a05:6000:4011:b0:3a4:d6ed:8e28 with SMTP id
 ffacd0b85a97d-3a6d12bbaa7mr4542681f8f.8.1750772910040; 
 Tue, 24 Jun 2025 06:48:30 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b00d:6d5f:6e67:f5e8])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-453646d14f3sm142211175e9.13.2025.06.24.06.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 06:48:29 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 15:48:29 +0200
Message-Id: <DAUT771C07KV.2JZ4ZCRQ1MEQM@ventanamicro.com>
Cc: <qemu-devel@nongnu.org>, "Alistair Francis" <alistair.francis@wdc.com>,
 "Weiwei Li" <liwei1518@gmail.com>, "Liu Zhiwei"
 <zhiwei_liu@linux.alibaba.com>, "Atish Patra" <atishp@rivosinc.com>,
 <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
To: "Daniel Henrique Barboza" <dbarboza@ventanamicro.com>,
 <qemu-riscv@nongnu.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH 1/2] target/riscv: disable *stimecmp interrupts without
 *envcfg.STCE
References: <20250623165329.2759651-1-rkrcmar@ventanamicro.com>
 <20250623165329.2759651-2-rkrcmar@ventanamicro.com>
 <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
In-Reply-To: <0811914e-623e-41a2-a54b-8ce42f45740c@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=rkrcmar@ventanamicro.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

2025-06-23T18:39:02-03:00, Daniel Henrique Barboza <dbarboza@ventanamicro.c=
om>:
> Hi Radim,
>
> It seems like this patch is breaking 'make check-functional':

That is a nice command to know of, thanks!

> 12/12 qemu:func-quick+func-riscv64 / func-riscv64-riscv_opensbi   TIMEOUT=
         90.06s   killed by signal 15 SIGTERM
>
> Checking the logs I verified that the problem can be reproduced by runnin=
g the
> 'spike' machine as follows:
>
> $ ./build/qemu-system-riscv64 -M spike   --nographic
> Segmentation fault (core dumped)
>
> The expected result is to boot opensbi. The problem can't be reproduced w=
ith
> the 'virt' board, so something that you did here impacted 'spike' in part=
icular
> for some reason.

Uff, mtimer is NULL on spike:

  0x0000555555c46618 in riscv_timer_write_timecmp (env=3Denv@entry=3D0x5555=
56888270, timer=3D0x5555568a61e0, timecmp=3D0, delta=3Ddelta@entry=3D0, tim=
er_irq=3Dtimer_irq@entry=3D32) at ../target/riscv/time_helper.c:49
  49	   uint32_t timebase_freq =3D mtimer->timebase_freq;
  (gdb) bt
  #0  0x0000555555c46618 in riscv_timer_write_timecmp (env=3Denv@entry=3D0x=
555556888270, timer=3D0x5555568a61e0, timecmp=3D0, delta=3Ddelta@entry=3D0,=
 timer_irq=3Dtimer_irq@entry=3D32) at ../target/riscv/time_helper.c:49
  #1  0x0000555555c6eb9e in write_menvcfg (env=3D0x555556888270, csrno=3D<o=
ptimized out>, val=3D<optimized out>, ra=3D140736012591329) at ../target/ri=
scv/csr.c:3214
  #2  0x0000555555c6a181 in riscv_csrrw_do64 (env=3Denv@entry=3D0x555556888=
270, csrno=3D<optimized out>, ret_value=3Dret_value@entry=3D0x0, new_value=
=3D<optimized out>, write_mask=3D<optimized out>, ra=3D140736012591329) at =
../target/riscv/csr.c:5579
  [...]
  (gdb) p mtimer
  $1 =3D (RISCVAclintMTimerState *) 0x0
  (gdb) p timer
  $2 =3D (QEMUTimer *) 0x5555568a61e0
  (gdb) p *timer
  $3 =3D {expire_time =3D -1, timer_list =3D 0x55555666b840, cb =3D 0x55555=
5c465d0 <riscv_stimer_cb>, opaque =3D 0x5555568856b0, next =3D 0x0, attribu=
tes =3D 0, scale =3D 1}

I'll try to figure out is going on, but `make check-functional` passes
with this hack:

diff --git a/target/riscv/time_helper.c b/target/riscv/time_helper.c
index 81a6a6394502..a2092206cb20 100644
--- a/target/riscv/time_helper.c
+++ b/target/riscv/time_helper.c
@@ -44,10 +44,8 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUT=
imer *timer,
                                uint64_t timecmp, uint64_t delta,
                                uint32_t timer_irq)
 {
-    uint64_t diff, ns_diff, next;
+    uint64_t diff, ns_diff, next, timebase_freq, rtc_r;
     RISCVAclintMTimerState *mtimer =3D env->rdtime_fn_arg;
-    uint32_t timebase_freq =3D mtimer->timebase_freq;
-    uint64_t rtc_r =3D env->rdtime_fn(env->rdtime_fn_arg) + delta;
=20
     /*
      * *envcfg.STCE disables *stimecmp interrupts, but still allows higher
@@ -59,6 +57,13 @@ void riscv_timer_write_timecmp(CPURISCVState *env, QEMUT=
imer *timer,
         return;
     }
=20
+    if (!mtimer) {
+        return;
+    }
+
+    timebase_freq =3D mtimer->timebase_freq;
+    rtc_r =3D env->rdtime_fn(env->rdtime_fn_arg) + delta;
+
     if (timecmp <=3D rtc_r) {
         /*
          * If we're setting an stimecmp value in the "past",

