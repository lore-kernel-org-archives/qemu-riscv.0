Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA44CCD185
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 03:33:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1v9Eju-00064g-9P; Wed, 15 Oct 2025 23:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v9Ejs-00064F-JY
 for qemu-riscv@nongnu.org; Wed, 15 Oct 2025 23:33:16 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1v9Ejq-0006Zv-Hn
 for qemu-riscv@nongnu.org; Wed, 15 Oct 2025 23:33:16 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-62fca01f0d9so509627a12.3
 for <qemu-riscv@nongnu.org>; Wed, 15 Oct 2025 20:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1760585592; x=1761190392; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zDx4vUBTXYtsKZguPSMTeW4z2LPKCHzenwLZ1f4KAqs=;
 b=XaU6jKDeQMkRHo/ZqzXwb86PkXx14qF6j9/+lknRaeQRd9HQHkdKFDU5zcZG67V0nM
 Z6KWw9PjDyG9SWno9cuPDGqLAH/HnlY/p1c3SbgR0w5V6jUKwAWTqSnrmlDAxB4hNUPY
 /DShG3S2pimpHPD5Q9vI/7mb2ejcmni6BVGrIS64AiWQnN3ymEsC+cKw6UPv0X/z2Xs6
 EudEGWO2RFxBWedNBR41gn53Nq4MZxNWZ6+PInq76HOIMeo948HuCSgkYyNj6b8YwY9A
 ctYs251/tgPOIjN9D1/6WEkSFsQQN++JJ9je4iSOUn02XUFJ8/kwpxzvtzNvzRY+otuk
 Jd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760585592; x=1761190392;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zDx4vUBTXYtsKZguPSMTeW4z2LPKCHzenwLZ1f4KAqs=;
 b=Dm3DjM3NPlP95V0JajrYSgblsfZ946Z8IQz1LQQ6pof+IWFDsYiCs3zK4by/8cuTYa
 q+nMyu33+L8rW/nXHhyQTQmwhM/ajC30RIsgk9efvmm9G/Pq50UikMV9xlvfItKNTXvn
 Itaqpgh8L9f7ClVga6QV/E2ALUSyc3jv0JctYTNEF+V0HjLs9rfOxGFd0D/1wLpEEsGh
 IXG7P+BxyCP1Yc5OjDxSCHoCEWsTgjz4IGeTGn6GZY5z5qD87fGc0z6Sj3DvPuGZr/9D
 r2FWIuWu4y64EtWY5cCyTZGJMuVJQDBX61jkK2Oj1eC7OQ/U+Ft6rfPbnpIjvhDV9Gxa
 BLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw2nK6wS7R70X3yg+FNslCfsCUbmLb28IxK75zyx08BH4S50NSHThK31xSSqn4j8nT/JduLXptTcs6@nongnu.org
X-Gm-Message-State: AOJu0YxviSt0eKSls2jQVlmZE+T5blBHtQ5vV8WuBBenpGaDS4WR47eT
 Eb1aYntzan0e2tV+UUl8otvesaplRCHerOPKaXeeS/rmKEU0temUBnr34l6lWnnnFLK0dnWT3Sv
 6cjsDIGvZBZ3Fw7gfGQvvc8PeplcFHoPpFM3aD0k54A==
X-Gm-Gg: ASbGncveAHrdTvhgrtvJk+CUmqBPRvea1GlpcQ6KvluKT1j+uTC2pUB+VGWOwG3Ie1b
 ntCb6vl8/PxHQxqYbUX5r5e5TD1mcAKi3GR7J4AEITJrYtbV5rP87KropfnsO3V0cjORbXy3hfd
 qxb+VE/KcqjlLE91gcxYTay+1If8sa4Q99+WA8IYi+TFMEN80pAnmbNgzDV0intl6XrS+3ri6cP
 2D9k1U6FaWujXgwTr1nY84v7wNjB+qK7Wn/Jf1dxxrS2QmGfQoYpY00OlN5jgkDQxFmgrC+fQ==
X-Google-Smtp-Source: AGHT+IFNR/dqk2CasjiAn0KLZAiGx7xDLkCVH3uRAftR/yiY8CdCTNrYgybdPcB+mDBG7egGKEqijznpJZsOEfSVEGc=
X-Received: by 2002:a05:6402:847:b0:637:8faa:9df7 with SMTP id
 4fb4d7f45d1cf-639d5c59ca3mr28678606a12.29.1760585591629; Wed, 15 Oct 2025
 20:33:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250417105249.18232-1-jim.shu@sifive.com>
 <20250417105249.18232-5-jim.shu@sifive.com>
 <e7616702-8a7b-4617-8433-236a1086bdf9@ventanamicro.com>
 <CALw707rstv76_oESKHzbeuPakSesWNBXogQoCJN4pHMj_wz7eg@mail.gmail.com>
 <125b7913-c8c0-448b-9f3f-3b893436b901@ventanamicro.com>
In-Reply-To: <125b7913-c8c0-448b-9f3f-3b893436b901@ventanamicro.com>
From: Jim Shu <jim.shu@sifive.com>
Date: Thu, 16 Oct 2025 11:33:00 +0800
X-Gm-Features: AS18NWA5bA5jEA-tEDP_afI62he9vjOlSwWxHC7oCalyWi0_exQBl7o125tVLJQ
Message-ID: <CALw707pE=oXYWrYndA8jaxeqxD-vM1bcqSMV_U8_vfYuGy-ZUg@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] exec: Add RISC-V WorldGuard WID to MemTxAttrs
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Rolnik <mrolnik@gmail.com>, 
 Helge Deller <deller@gmx.de>, Song Gao <gaosong@loongson.cn>,
 Laurent Vivier <laurent@vivier.eu>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <arikalo@gmail.com>, 
 Stafford Horne <shorne@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=jim.shu@sifive.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Hi Daniel,

Thanks for the suggestion. I will add it in the v3 patches.

- Jim

On Mon, Oct 13, 2025 at 1:27=E2=80=AFAM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
>
>
> On 10/8/25 2:54 AM, Jim Shu wrote:
> > Hi Daniel,
> >
> > Both '_reserved1' and '_reserved2' fields are only for padding
> > MemTxAttrs struct to be 8-byte [1], so I remove a 1-byte reserved
> > field when adding 'world_id' field to it.
> > Is it ok for you? Or you think it is better to separate them.
>
> It's fine. I suggest adding this explanation in the commit msg to avoid
> further questions about it.
>
>
> Thanks,
>
> Daniel
>
> >
> >
> > [1]
> > commit 5014e33b1e00d330f13df33c09a3932ac88f8d94
> > Link: https://lore.kernel.org/r/20250121151322.171832-2-zhao1.liu@intel=
.com
> >
> > Thanks!
> >
> > On Sat, Aug 9, 2025 at 8:34=E2=80=AFPM Daniel Henrique Barboza
> > <dbarboza@ventanamicro.com> wrote:
> >>
> >>
> >>
> >> On 4/17/25 7:52 AM, Jim Shu wrote:
> >>> RISC-V WorldGuard will add 5-bit world_id (WID) to the each memory
> >>> transaction on the bus. The wgChecker in front of RAM or peripherals
> >>> MMIO could do the access control based on the WID. It is similar to A=
RM
> >>> TrustZone NS bit, but the WID is 5-bit.
> >>>
> >>> The common implementation of WID is AXI4 AxUSER signal.
> >>>
> >>> Signed-off-by: Jim Shu <jim.shu@sifive.com>
> >>> ---
> >>>    include/exec/memattrs.h | 8 ++++++--
> >>>    1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> >>> index 8db1d30464..7a6866fa41 100644
> >>> --- a/include/exec/memattrs.h
> >>> +++ b/include/exec/memattrs.h
> >>> @@ -54,6 +54,11 @@ typedef struct MemTxAttrs {
> >>>         */
> >>>        unsigned int pid:8;
> >>>
> >>> +    /*
> >>> +     * RISC-V WorldGuard: the 5-bit WID field of memory access.
> >>> +     */
> >>> +    unsigned int world_id:5;
> >>> +
> >>>        /*
> >>>         * Bus masters which don't specify any attributes will get thi=
s
> >>>         * (via the MEMTXATTRS_UNSPECIFIED constant), so that we can
> >>> @@ -63,8 +68,7 @@ typedef struct MemTxAttrs {
> >>>         */
> >>>        bool unspecified;
> >>>
> >>> -    uint8_t _reserved1;
> >>> -    uint16_t _reserved2;
> >>> +    uint16_t _reserved1;
> >>
> >> Is 'reserved2' unused? Not sure why you ended up removing it in this p=
atch.
> >>
> >> If it's really unused it's ok to remove it but this should be done in =
separate.
> >>
> >>
> >> Thanks,
> >>
> >> Daniel
> >>
> >>
> >>>    } MemTxAttrs;
> >>>
> >>>    QEMU_BUILD_BUG_ON(sizeof(MemTxAttrs) > 8);
> >>
>

