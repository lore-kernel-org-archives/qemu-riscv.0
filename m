Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5B9CD98DE
	for <qemu-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:36:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wZ6Xo-0000Wq-12; Mon, 15 Jun 2026 08:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ6Xl-0000WC-NJ
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 08:35:57 -0400
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <qingwei.hu@bytedance.com>)
 id 1wZ6Xi-0007eZ-Tr
 for qemu-riscv@nongnu.org; Mon, 15 Jun 2026 08:35:57 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-69e9b037d82so2557868eaf.2
 for <qemu-riscv@nongnu.org>; Mon, 15 Jun 2026 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1781526953; x=1782131753; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lJBaTgnYBhJ/7ZxZTUrmZhgNziWSVLbeEuWoj2TvCuQ=;
 b=jnpSXq4HFdGjs4IWTAmJLWkb1LQy0eQ/CU9/pHgJoA0rL09ob3cVGTS3pzTiuVkCxo
 yJOE99hOfdZ4Ef9fEOT7J1rcjaS4QitSlAER02pXiFxfX3B2tPFRS27XEGhHmuyHeNP2
 uvyakyLsQKAwmYly8KotBS38kW3Hl78+LUwk5Ius2MpsKJFlBHUt/vYcQWRry5tRh8OH
 Cq84EmXP4RtcrnhPAvEGB1AvS8pZQgX0O1V+PY+olWV/1soXtZ0qd8PXDXkW99XKLKdx
 ld9ECUTkoAcM4cONoA7pW8KEaO4V++DO0wIpOqFy8eKKhLa+ETpqzhHwd1DBkGcwj6Zk
 263g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781526953; x=1782131753;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lJBaTgnYBhJ/7ZxZTUrmZhgNziWSVLbeEuWoj2TvCuQ=;
 b=P17x3eUdUOe6mvK6UbluextYGsDiqLl4RkPWfEwc495POpkVpiF3cAYYXh5SUh5D1D
 F38lMoWvVLa+deW30Wly5TCSMJ79LzgEOnqR4t2nJvsu+JgJIGFdgMRX6gnWNQ0hLwwd
 dWUJ8dII/x1l1B9N6uwkVlJEGGu13z6/9Y5XEUAGRJg2n4+w33ULQHa7gYnkV3Asz2U/
 aqN6DyLrcb03MhIoajs1CDygB45D+hW04r1/gAQDMjERBAKwpGp6lUq1pdJfyMBZJoXI
 BKm7bVuw/l0irgOcmHBU1HlcmdZE8l0n7npXR6s8PsE1CAvzZjH4/ErIkdFh+TaadRK8
 Pp8Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+Ctqy8dl96P5+yw+Mo3KSxjwbvvJ2qMC9N3eMN48bgAAWBCWAEoxlqMPCxP0x4mRv/0FtPKl+g30v7@nongnu.org
X-Gm-Message-State: AOJu0Yy17okav54AyHl8QouaYp7poy92RNjlVNeYaCUkrkbUwGqlRTVX
 pwZCMvHfq9UHWuRowVHTQRBWPDZuaDKajT2Ps/KOg0RvcLKuKhsenUX3TvhvTUirIP2BvOc94Kh
 2CFpm
X-Gm-Gg: Acq92OHmwBn9rFK4wgqcJQBq8QBW4z11df0+r5o3Fed6Mkh6BIVnjHafwnx+SN4oVmk
 +8lUIQKWjlnCna4kI033x3HJ2GrrA+V1Z/ozwDu9mQYK907r3vgjpS/YTqUL15MZp3iSlW1lRJ5
 BRMO8YcfJ2mz0KzOgwVM13GTNFBv6MgBXWVzCujevx9buDGNhNv0Qy1/l/npr2iaXZ3KodnA/Gz
 rs1Vkc8idGetBG3onctxXGXkwyOlCFaQrmnsNxb/cS40hs7EC/q7OT3PUok0YBhjBybrbaIFiJk
 HGLcUmccglu12PA9a0uzCJKioUbkjRfTe6g1yQcUNg8DUELK3do87EapHMjFUU//8ilulmcr3Zj
 AsZN17T8KvIghlf39lPLbe4ChqCJpfcHeg5ydf3i98u87tHEiwsqnwdXW8yZNRwOwKw51ofWbiT
 QADwqIvs63FmsywjYorFLZNn30W4vkLmewo6c=
X-Received: by 2002:a05:6820:214:b0:69d:8555:c458 with SMTP id
 006d021491bc7-69edc675fbbmr8713820eaf.24.1781526952881; 
 Mon, 15 Jun 2026 05:35:52 -0700 (PDT)
Received: from smtpclient.apple ([240e:694:e20:401::4])
 by smtp.gmail.com with ESMTPSA id
 006d021491bc7-69f00d2138dsm2895493eaf.5.2026.06.15.05.35.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2026 05:35:52 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [External] [PATCH] hw/intc: riscv_aia: Skip reset for KVM irqchip
From: Qingwei Hu <qingwei.hu@bytedance.com>
In-Reply-To: <SE3PR04MB89223BFA19CAED63F7C799EFF31B2@SE3PR04MB8922.apcprd04.prod.outlook.com>
Date: Mon, 15 Jun 2026 20:35:21 +0800
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, palmer@dabbelt.com,
 alistair.francis@wdc.com, liwei1518@gmail.com,
 daniel.barboza@oss.qualcomm.com, zhiwei_liu@linux.alibaba.com,
 chao.liu.zevorn@gmail.com, jim.shu@sifive.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3284CAB2-000E-468C-A565-7F28F145C032@bytedance.com>
References: <20260605110621.644997-1-qingwei.hu@bytedance.com>
 <SE3PR04MB89223BFA19CAED63F7C799EFF31B2@SE3PR04MB8922.apcprd04.prod.outlook.com>
To: "Nutty.Liu" <nutty.liu@hotmail.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=qingwei.hu@bytedance.com; helo=mail-oo1-xc2b.google.com
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


> On Jun 11, 2026, at 18:06, Nutty.Liu <nutty.liu@hotmail.com> wrote:
>=20
>=20
> On 6/5/2026 7:06 PM, Qingwei Hu wrote:
>> The emulated APLIC and IMSIC state arrays are only allocated when =
QEMU
>> handles the interrupt controller state itself. With KVM =
AIA/APLIC-IMSIC,
>> the interrupt controller state is owned by the KVM in-kernel irqchip, =
so
>> these emulated state arrays are not allocated.
>>=20
>> The reset handlers added for APLIC and IMSIC still clear those arrays
>> unconditionally. This makes qemu_system_reset(), which runs during =
machine
>> creation, dereference NULL pointers with -machine =
virt,aia=3Daplic-imsic and
>> KVM.
>>=20
>> Skip the emulated APLIC and IMSIC reset paths when the interrupt =
controller
>> is handled by KVM. The emulated paths are unchanged for TCG and for
>> configurations that use QEMU emulation.
>>=20
>> Fixes: 99bfcd329a ("hw/intc: riscv_aplic: Add reset API to APLIC")
>> Fixes: 766391483b ("hw/intc: riscv_imsic: Add reset API to IMSIC")
>> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> It would be better to split it into two fix patches.
> Otherwise,
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
>=20
> Thanks,
> Nutty

Hi Nutty,

Thanks for the review. I will split this into two patches and send a v2.

Best regards,
Qingwei

>> ---
>>  hw/intc/riscv_aplic.c | 4 ++++
>>  hw/intc/riscv_imsic.c | 4 ++++
>>  2 files changed, 8 insertions(+)
>>=20
>> diff --git a/hw/intc/riscv_aplic.c b/hw/intc/riscv_aplic.c
>> index c2c67c29e6..84606e9f3d 100644
>> --- a/hw/intc/riscv_aplic.c
>> +++ b/hw/intc/riscv_aplic.c
>> @@ -910,6 +910,10 @@ static void riscv_aplic_reset_enter(Object *obj, =
ResetType type)
>>      RISCVAPLICState *aplic =3D RISCV_APLIC(obj);
>>      int i;
>>  +    if (!riscv_use_emulated_aplic(aplic->msimode)) {
>> +        return;
>> +    }
>> +
>>      aplic->domaincfg =3D 0;
>>      memset(aplic->sourcecfg, 0, sizeof(uint32_t) * aplic->num_irqs);
>>      memset(aplic->target, 0, sizeof(uint32_t) * aplic->num_irqs);
>> diff --git a/hw/intc/riscv_imsic.c b/hw/intc/riscv_imsic.c
>> index ac59496c22..f1f23c3a3e 100644
>> --- a/hw/intc/riscv_imsic.c
>> +++ b/hw/intc/riscv_imsic.c
>> @@ -347,6 +347,10 @@ static void riscv_imsic_reset_enter(Object *obj, =
ResetType type)
>>      RISCVIMSICState *imsic =3D RISCV_IMSIC(obj);
>>      int i;
>>  +    if (kvm_irqchip_in_kernel()) {
>> +        return;
>> +    }
>> +
>>      memset(imsic->eidelivery, 0, sizeof(uint32_t) * =
imsic->num_pages);
>>      memset(imsic->eithreshold, 0, sizeof(uint32_t) * =
imsic->num_pages);



