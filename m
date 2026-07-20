Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94EF5C44520
	for <qemu-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 12:07:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wlmmI-00085u-Mp; Mon, 20 Jul 2026 08:07:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wlmmG-00084C-E1
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 08:07:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <subrahmanya.lingappa@oss.qualcomm.com>)
 id 1wlmmE-0005r1-I2
 for qemu-riscv@nongnu.org; Mon, 20 Jul 2026 08:07:20 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66KAw3iR2377660
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8M/iB3BYcAwU+sx5HK7Ou6wNWTkxnYicJonW/GF/nAo=; b=NLVZq3gwt2k/HOvK
 YAjfqgqg+dWi+6h1zLvCMIXSUkyJ5YFr/j79OBSQof9MZA5EwyzdzW8wXbCYN+UV
 ulAu66//AbcdEuJmkcXibvh30tDzRDXOuC5tGQkWfF+3utP4R6gidlbLM3PdNb1b
 xxweC9rLEsQZGKzORXRysw9XtuOKV+TgfhxTTtjCiwWki3uUwOxagKBN8+aPmzTE
 igTbeULfLd4t4mP8Ifo3WrDfclZUYdyjw1OZBk6siuo7CWjZYi7PjWR99mAcXnpA
 LVaVwXXGBPRMCKeuSQrYVwylZlEzKxoObg27MNDr6y/z4VMUvf6QyRceT6PluBdb
 iZl+dQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhgre8s10-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 12:07:16 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-81ee2f3ff06so6512537b3.0
 for <qemu-riscv@nongnu.org>; Mon, 20 Jul 2026 05:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784549236; cv=none;
 d=google.com; s=arc-20260327;
 b=Z9tgY2bt9WEa1Lb0pYSiFTtfePaOuGOeoeFAEDA/W6G2pTLuRjRiCYaSwFSvuw8Pd2
 bNyfWGHjF+koWi4IqsAJdZ5g356VqW3tATz7VxzWTlOa8Js15X7RBU1vhbiLYzOJi+pE
 k5X5RjeozU+H1xqB5PGSz2P8/+pE53qQ0ke7RTJ50Pha3Hu7BUtQ/nynsNMIfCYmlmVJ
 tmg/SNI6ULlOAqyhBIshYLMVuaceapnmh//dxTAnj1VUbf3sckb0UzHqvz6hCLyiNyZ5
 WCq780L7ffvucot0Qjdortpt6Q5brOBUQiACYUZcjgaa2XOj6frhrZvAHWYHvyhFsC9H
 oMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8M/iB3BYcAwU+sx5HK7Ou6wNWTkxnYicJonW/GF/nAo=;
 fh=gBPA8LXodB/qtOxrajSg6OMA6Rl8qXqlP6zPvV1htXg=;
 b=A74EJx49MWcKBMonFA0sdyOtsUkFjuvFUN42LZrYvlEOcwAnSlFbk2cVnX2aVDtTyj
 1FC9Zu1KI0jcwFG2V8bebD7kPC91dTjAVeHWvggHCmwBpUnGSUXe9g202/xcCqFMnw2c
 9wWU342d8jnQZu5VUUjkxUY2b1tZRo3pLGmJBMSkyHljvshv61/dTtbGQNz+FMSTtEHL
 ieJJQJdOsD81jhuWXWILMU/5eQzeBr4f0as0ya1b6gfWOTFZ+jFW24ZXKSbdrfJKGgZn
 qbq1qp5IJN1zZpJnlpGFSE+9UNs01c41PdV0DO3yFOZko4CoIsSp6sLkAbGJ0vTdlHXG
 ngXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784549236; x=1785154036; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8M/iB3BYcAwU+sx5HK7Ou6wNWTkxnYicJonW/GF/nAo=;
 b=CuAAAAOCZtyd/8qHB0awITEJEMivdtDHbsx4C4SsqYorjHW67QkbMpVD1im+lN7/0h
 S8pNcvsxX5Maed6YBxtfoiRRZbKs5V/AqC/PCYvqL+5eGJOeU5ICZELvr0PYKBRdtAyA
 q2JmUwQ+lGYLg1rc87sPuX8lzLCDa7i+6ZDXqwg68Ef5/IQ7ktIiEJlzuE0Jyagy+j/U
 UgYIEf//oimWsxOS97cXu1UW1YfLZt6kHoKOGxYqgX7im1hDLfAJ4II2xYrHERVip/8v
 QLV+AozOZmG9kEdFzFeZ+bjPmS169K514jE9tPjU8r7ecHDNFKJr3BG//BsOBfys54Ps
 XKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784549236; x=1785154036;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=8M/iB3BYcAwU+sx5HK7Ou6wNWTkxnYicJonW/GF/nAo=;
 b=rQhgVfHXbJJGnWT3oxtERhlrSa/WYFlU5vZqWGU1hJEOiC0j75T2Quwl7HDjJ+XXMM
 n64jPmnp5YlwZmuVCzz/zoa4KnG/JCJHImxeaZ+gX72vXcEjpsdXTtpJPKxxoXA/1jyj
 48CYWsa+0EoUn+dAhvGixsrzNekc7SCMPRGcHv0+ka+sR7Ia14aY2EgeFooABlChnBW9
 1ZssP/dlf+YCznKrljhXEjw3Q5/yv12RDM50NXfwd0QTPk4op/Q9c2vsH7Ny73H1AOxX
 WnwuTdb4YGiGIOai1ygvt5xlC/fpf02fmqiCzXVJ38qVjx95IMc7jmIEwGGxaJ4av1jA
 kJ3g==
X-Gm-Message-State: AOJu0Yyv5HYPC7bDNUOKyJkDwMh4xkvdhtSNiaM90bXlDCwPSnzagA31
 qYdqa+864ufzrAERKZ1peYkZRaFP9+OUDmyS+ZzrRnJH8/LXREUPW03VWgy8j/0GUDNGHy2AZKM
 u2HPgO0mD0rcDTK+qM7nyIwovDcA4tzO/DOuZ3/TrCv0zsal1aAsNip+H5DzdACUtYeeNUkD8M4
 Etyy/HQ11KJzxVeC2TU/cQnJ95ryTxEUus
X-Gm-Gg: AR+sD11uNdXLrqgrhMefzghyKCDB3TNJvjSIr29TLLeGL/EW3TEmzzRlKvQzOs4PTxD
 q8WYQp8fRD2y649YrMiDEeOUUc2kMFT3uPlAIJ818n7T7F1d4L6uDQYcTBO1QekdTZj72pZ9q8d
 ezeFA1Dk0ysGiOa7JMfdUI3dBbFZ9BnT4gTsg+FdCWXfapI8VpafplRi1+kv0=
X-Received: by 2002:a05:690c:c4fa:b0:81d:745d:6815 with SMTP id
 00721157ae682-81f20f76a26mr1114087b3.7.1784549236444; 
 Mon, 20 Jul 2026 05:07:16 -0700 (PDT)
X-Received: by 2002:a05:690c:c4fa:b0:81d:745d:6815 with SMTP id
 00721157ae682-81f20f76a26mr1113907b3.7.1784549235978; Mon, 20 Jul 2026
 05:07:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260714075659.2258023-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260714075659.2258023-6-subrahmanya.lingappa@oss.qualcomm.com>
 <a3eea16c-9d47-400e-83ca-b59b02dca5b7@oss.qualcomm.com>
In-Reply-To: <a3eea16c-9d47-400e-83ca-b59b02dca5b7@oss.qualcomm.com>
From: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 17:37:04 +0530
X-Gm-Features: AUfX_mx3fC2WjCsKKv3ewVYeiDJCfpeD4pWhavdoniB1dYPSuSMFzxe7jTjCpHA
Message-ID: <CAPxK-6dpA5BHEtNL4wd0EY65tA1Wpg2aAeM7ESEAwLwma6sASA@mail.gmail.com>
Subject: Re: [PATCH v3 05/10] riscv: add RPMI system reset service
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-riscv@nongnu.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEzNSBTYWx0ZWRfXw4s6N6FVPlgt
 apOSk1drYIkxI/17dgj9xvqKA1bwUel0hR+sHwrMwlflh6OP/glxvBw01KIgCNJMFHfCFnlCSc/
 C2tdc8M96Ru+1+m9g2wx3Q1oVlu4Kcg=
X-Proofpoint-GUID: deAOe1G8J7LaU8U-QuCO5hN0VO06WOlv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEzNSBTYWx0ZWRfXxRj/oN4BXhg7
 lLydaZZLCVlGyHUsBlVthuFDzgwCUDPKbJGEcqVK361ELrHI/S+BAtI8wAMNqNH6JKE76iIY+qR
 4HwSWYIPfHlKEys6Qc1j1f25BJGMtNFoTKd59kVVelLOPmU96KlXJC/TQpD2YuahjYOm73qzhx6
 5wUwWtbffaa09TbDgejj/eWSlPOLQQ8mep6mUSKo1Qp4sTJe2WYrXl0KivfWxHOJ+m1WBdClBLl
 nhDfluBwOE+5AutLcZuOwjbrYB/SZS67CsjzqpbD/l2yUZa4hAzv1Y5G9426YlCuflW83w4AeOs
 UFTuMIlPRdAXdMAWB0fBpIEYG5Hy1Z3LfXVjZMR8pFCuPeFB6PdbRIHboTr2xc98jv58lUBF/pV
 LZry1CUbkuGOO3YgB43KYR+JaApi83Ai36Jx0LKFdgJ4mOZIPXwde0Ki93ET/7bAh2ewo3/nLuj
 CAcOhOPgb00qh+x86ew==
X-Proofpoint-ORIG-GUID: deAOe1G8J7LaU8U-QuCO5hN0VO06WOlv
X-Authority-Analysis: v=2.4 cv=foLsol4f c=1 sm=1 tr=0 ts=6a5e0f75 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=0-kEWU25KoZTyFKMV0YA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200135
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=subrahmanya.lingappa@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

Philippe,

On Mon, Jul 20, 2026 at 4:29=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 14/7/26 09:56, Subrahmanya Lingappa wrote:
> > Add a QEMU implementation of the RPMI System Reset service group.
> >
> > The service advertises shutdown and cold reboot reset types, validates
> > guest requests, and dispatches accepted requests through the machine
> > reset and shutdown callbacks. This lets firmware use RPMI reset command=
s
> > while keeping the board-specific reset policy in the RISC-V virt machin=
e.
> >
> > Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.=
com>
> > ---
> >   hw/misc/meson.build           |   1 +
> >   hw/misc/riscv_rpmi.c          |  38 ++++++-
> >   hw/misc/riscv_rpmi_internal.h |   9 ++
> >   hw/misc/riscv_rpmi_sysreset.c | 206 +++++++++++++++++++++++++++++++++=
+
> >   hw/riscv/virt.c               |  40 +++++++
> >   include/hw/misc/riscv_rpmi.h  |  13 ++-
> >   include/hw/riscv/rpmi-fdt.h   |  11 ++
> >   7 files changed, 313 insertions(+), 5 deletions(-)
> >   create mode 100644 hw/misc/riscv_rpmi_sysreset.c
>
>
> > diff --git a/include/hw/misc/riscv_rpmi.h b/include/hw/misc/riscv_rpmi.=
h
> > index b5d8a32f9b..d11db87731 100644
> > --- a/include/hw/misc/riscv_rpmi.h
> > +++ b/include/hw/misc/riscv_rpmi.h
>
>
> > +typedef struct RiscvRpmiMachineOps {
> > +    void (*system_reset)(void *opaque);
> > +    void (*system_shutdown)(void *opaque);
>
> What is the plan for this @opaque argument?
>
 The opaque argument was only future-proofing and is not needed by
  the current virt machine callbacks, so I'll remove it instead of
keeping unused
  callback state. in v5

Thanks,
subbu

> > +} RiscvRpmiMachineOps;
> >   typedef struct RiscvRpmiServiceConfig {
> >       RiscvRpmiServiceKind kind;
> >       const char *node_name;
> > @@ -56,7 +62,8 @@ typedef struct RiscvRpmiConfig {
> >       uint32_t a2p_req_size;
> >       uint32_t p2a_req_size;
> >       const char *platform_info;
> > -
> > +    const RiscvRpmiMachineOps *machine_ops;
> > +    void *machine_opaque;
> >       const uint32_t *hart_ids;
> >       uint32_t hart_count;
> >       const RiscvRpmiServiceConfig *services;
> > @@ -73,7 +80,9 @@ struct RiscvRpmiState {
> >       uint32_t a2p_req_size;
> >       uint32_t p2a_req_size;
> >       char *platform_info;
> > -
> > +    const RiscvRpmiMachineOps *machine_ops;
> > +    void *machine_opaque;
> > +    struct rpmi_service_group *sysreset_group;
> >       uint32_t *hart_ids;
> >       uint32_t hart_count;
> >       const RiscvRpmiServiceConfig *services;
>

