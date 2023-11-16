Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFC0C54FB9
	for <qemu-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 12:11:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1r3bDd-0006zg-Hz; Thu, 16 Nov 2023 07:11:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3bDX-0006wA-SM; Thu, 16 Nov 2023 07:11:32 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rcardenas.rod@gmail.com>)
 id 1r3bDV-0000af-K1; Thu, 16 Nov 2023 07:11:31 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32f9268bf8cso564651f8f.0; 
 Thu, 16 Nov 2023 04:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700136687; x=1700741487; darn=nongnu.org;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VciyRpCFXVbPSHDM19d9j036WEXfRUblGoiYajEmucY=;
 b=CTJhQhUJ7x5wuaEcB1pPQxdWO0LYi6JGUTQgiHUAlCAzgBBLc5e3iqneefSBKLg3wy
 N9qKWYVThTZ0eoWqLBzSFr1cweC0Q3DN0bwED2fe6fsF5khENwNAHm2RZ4hAMuDEuFaG
 TOSZuLUrBiiAbTsppUmOOwhgrdhujz6bE+DxTR79TipIsGWpgfvmd9vHbUbOAoxckSKp
 H6wuxScuqhrcGI7UBorDA5rdvONeerj/zKPmlFLS30um8JwAofar+HkUbSlWEU6+3RgP
 8xGBWiEvOs4O3mGvVRoEfZiJwOoonHXhqEuomgbj+CG1oauXArWuEYFAW7gc0212YDkJ
 eE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700136687; x=1700741487;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VciyRpCFXVbPSHDM19d9j036WEXfRUblGoiYajEmucY=;
 b=TzdgkRYZrvEXcT4XkItdxctDT4NTw0AUc5tmEIco9Rbdz4NOUS5FTpCRNO+KqPA2Qe
 jawSJc31M4NDV5+s/au/jaWywiuXunJG+VeWGqvxH/9jwI3ex0/rfsfnSkeGc+fmW+UR
 mnTqSttGGFLMPBFt2o2f7j4SboxSiLNKIj/Q60IMFM+nHkft+tKipAfEjN4awle75ng2
 FkYt9Cwl/SbMuOWmTQV11e+O9+Hemi1IlIIEMuTgTYdwW3DU3ZfZU9lAgPmklBQct7ex
 z/zVxYp1dMQE2BFO7SXoTpFmQMHg8f7MDNt67lZYx+NOYkpsr9dzaKY6ttCUBLgllcz7
 RvyQ==
X-Gm-Message-State: AOJu0YxFRFPAnKMA8urEdRNZMDN9witgBi0Ej3HllTzF3GB1lpx3Jvtb
 9J3VY8rE0M6OY2TxCOVreqk=
X-Google-Smtp-Source: AGHT+IGYjqUWfXNxM+Vh7Vd8eK6KkWOJDlqXnayH+bjM9tOPCvoraCVTN4E+gNMRL1+p7pHHQqCVLg==
X-Received: by 2002:adf:a3cd:0:b0:331:3b59:3edb with SMTP id
 m13-20020adfa3cd000000b003313b593edbmr10019007wrb.42.1700136686661; 
 Thu, 16 Nov 2023 04:11:26 -0800 (PST)
Received: from smtpclient.apple ([213.94.54.170])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a5d6dc5000000b0032daf848f68sm13461062wrz.59.2023.11.16.04.11.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 Nov 2023 04:11:26 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.100.2.1.4\))
Subject: Re: [PATCH] Fix CLINT clock frequency for SiFive E
From: =?utf-8?B?Um9tw6FuIEPDoXJkZW5hcyBSb2Ryw61ndWV6?=
 <rcardenas.rod@gmail.com>
In-Reply-To: <d5232072-018a-40e2-8c25-096ed18ca641@ventanamicro.com>
Date: Thu, 16 Nov 2023 13:11:14 +0100
Cc: qemu-devel@nongnu.org, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AE31C5C3-21EF-4658-BB4C-6E0FD61AB02D@gmail.com>
References: <20231110161457.60528-1-rcardenas.rod@gmail.com>
 <035908b8-4964-4878-a0c3-bca06af45b54@ventanamicro.com>
 <ECB4CA72-630F-4DAC-9386-D0884DB9DA9F@gmail.com>
 <d5232072-018a-40e2-8c25-096ed18ca641@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
X-Mailer: Apple Mail (2.3774.100.2.1.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=rcardenas.rod@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Done! Let me know if I missed something

Kind regards,
Rom=C3=A1n

> On 16 Nov 2023, at 12:57, Daniel Henrique Barboza =
<dbarboza@ventanamicro.com> wrote:
>=20
>=20
>=20
> On 11/15/23 18:06, Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez wrote:
>> Hi, Daniel!
>> Sorry for that, I=E2=80=99m quite new to this way of contributing =
(you may notice that I sent the same patch several times, I apologize).
>> If you check the manual of SiFive E310 =
(https://cdn.sparkfun.com/assets/7/f/0/2/7/fe310-g002-manual-v19p05.pdf?_g=
l=3D1*w2ieef*_ga*MTcyNDI2MjM0Ny4xNjk2ODcwNTM3*_ga_T369JS7J9N*MTY5Njg3MDUzN=
y4xLjAuMTY5Njg3MDUzNy42MC4wLjA. =
<https://cdn.sparkfun.com/assets/7/f/0/2/7/fe310-g002-manual-v19p05.pdf?_g=
l=3D1*w2ieef*_ga*MTcyNDI2MjM0Ny4xNjk2ODcwNTM3*_ga_T369JS7J9N*MTY5Njg3MDUzN=
y4xLjAuMTY5Njg3MDUzNy42MC4wLjA.>), you can see in Figure 1 that the =
CLINT is connected to the real time clock, which also feeds the AON =
peripheral (they share the same clock).
>> In page 43, the docs also say that the timer registers of the CLINT =
count ticks from the rtcclk.
>> I attached a couple of screenshots to ease the process.
>> Thank you very much for your time, let me know if I can help you with =
further documentation
>> PS: I am currently playing with bare metal applications both in QEMU =
and a physical SiFive E310 board and I confirm that the CLINT clock in =
the physical board runs at 32.768 kHz. In QEMU, the same app produces a =
completely different outcome, as sometimes a new CLINT interrupt is =
triggered before finishing other tasks.
>=20
>=20
> I read the doc and this makes sense.
>=20
> Can you please re-send the patch, same code, but with all this =
information in the commit
> message? We need this context to justify changing the existing =
sifive-e board clock.
>=20
> ps: It would be nice if someone from Sifive could drop an ACK in this =
change.
>=20
>=20
> Thanks,
>=20
> Daniel
>=20
>> Screenshot 2023-11-15 at 21.58.17.png
>> Screenshot 2023-11-15 at 21.57.27.png
>>> On 15 Nov 2023, at 21:51, Daniel Henrique Barboza =
<dbarboza@ventanamicro.com> wrote:
>>>=20
>>> Hi Roman!
>>>=20
>>> It helps to add the maintainers/reviewers in the CC when sending the =
patch. You
>>> can see who need to be CCed by using the get_maintainer.pl script. =
E.g:
>>>=20
>>> ./scripts/get_maintainer.pl \[PATCH\]\ Fix\ CLINT\ clock\ frequency\ =
for\ SiFive\ E\ -\ rcardenas.rod@gmail.com\ -\ 2023-11-10\ 1314.eml
>>>=20
>>> Alistair Francis <Alistair.Francis@wdc.com> (supporter:SiFive =
Machines)
>>> Bin Meng <bin.meng@windriver.com> (supporter:SiFive Machines)
>>> Palmer Dabbelt <palmer@dabbelt.com> (supporter:SiFive Machines)
>>> Weiwei Li <liwei1518@gmail.com> (reviewer:RISC-V TCG CPUs)
>>> Daniel Henrique Barboza <dbarboza@ventanamicro.com> (reviewer:RISC-V =
TCG CPUs)
>>> Liu Zhiwei <zhiwei_liu@linux.alibaba.com> (reviewer:RISC-V TCG CPUs)
>>> qemu-riscv@nongnu.org (open list:SiFive Machines)
>>> qemu-devel@nongnu.org (open list:All patches CC here)
>>>=20
>>>=20
>>> I'm CCing all these folks in the reply.
>>>=20
>>>=20
>>> On 11/10/23 13:14, rcardenas.rod@gmail.com wrote:
>>>> From: Rom=C3=A1n C=C3=A1rdenas Rodr=C3=ADguez =
<rcardenas.rod@gmail.com>
>>>> ---
>>>>  hw/riscv/sifive_e.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>> diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
>>>> index 0d37adc542..87d9602383 100644
>>>> --- a/hw/riscv/sifive_e.c
>>>> +++ b/hw/riscv/sifive_e.c
>>>> @@ -225,7 +225,7 @@ static void sifive_e_soc_realize(DeviceState =
*dev, Error **errp)
>>>>              RISCV_ACLINT_SWI_SIZE,
>>>>          RISCV_ACLINT_DEFAULT_MTIMER_SIZE, 0, ms->smp.cpus,
>>>>          RISCV_ACLINT_DEFAULT_MTIMECMP, RISCV_ACLINT_DEFAULT_MTIME,
>>>> -        RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, false);
>>>> +        SIFIVE_E_LFCLK_DEFAULT_FREQ, false);
>>>=20
>>> I'm not sure if this is correct. The last commit that touched this =
line was b8fb878aa2
>>> ("hw/intc: Upgrade the SiFive CLINT implementation to RISC-V =
ACLINT"). If you see the commit
>>> diff, the previous value was:
>>>=20
>>> -            SIFIVE_CLINT_TIMEBASE_FREQ, false);
>>>=20
>>> In this same commit we can see that the existing value of that macro =
back then was:
>>>=20
>>> -    SIFIVE_CLINT_TIMEBASE_FREQ =3D 10000000
>>>=20
>>>=20
>>> Which is the same value of RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ.
>>>=20
>>>=20
>>> The value you're changing to, SIFIVE_E_LFCLK_DEFAULT_FREQ (32768), =
seems to be related to the
>>> SIFIVE AON watchdog implemented in hw/misc/sifive_e_aon.c:
>>>=20
>>> static void sifive_e_aon_init(Object *obj)
>>> {
>>>    SysBusDevice *sbd =3D SYS_BUS_DEVICE(obj);
>>>    SiFiveEAONState *r =3D SIFIVE_E_AON(obj);
>>>=20
>>>    memory_region_init_io(&r->mmio, OBJECT(r), &sifive_e_aon_ops, r,
>>>                          TYPE_SIFIVE_E_AON, SIFIVE_E_AON_MAX);
>>>    sysbus_init_mmio(sbd, &r->mmio);
>>>=20
>>>    /* watchdog timer */
>>>    r->wdog_timer =3D timer_new_ns(QEMU_CLOCK_VIRTUAL,
>>>                                 sifive_e_aon_wdt_expired_cb, r);
>>>    r->wdogclk_freq =3D SIFIVE_E_LFCLK_DEFAULT_FREQ;   <=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
>>>    sysbus_init_irq(sbd, &r->wdog_irq);
>>> }
>>>=20
>>>=20
>>>=20
>>> Thanks,
>>>=20
>>>=20
>>> Daniel
>>>=20
>>>=20
>>>=20
>>>>      sifive_e_prci_create(memmap[SIFIVE_E_DEV_PRCI].base);
>>>>        /* AON */


