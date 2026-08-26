Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60167C5DF97
	for <qemu-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 15:05:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzFBk-0008IS-MF; Wed, 26 Aug 2026 11:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzFBj-0008I6-7W
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 11:05:15 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzFBh-0002Is-Ee
 for qemu-riscv@nongnu.org; Wed, 26 Aug 2026 11:05:14 -0400
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67QDumNY1703178
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:05:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ivHQtH7J1gihc5fUm7h5lY7upQT/cUC9c8mXJEgbi7I=; b=eNW0uXqF2pRUnnrO
 V/6P9/LD05Wr5e8fEYPdZ4FPfbnAdlyVlicQi8zHAv/c4eLGfuk4v2Yu6xvm4o6Y
 qqFP0DjyH0J9h3XOYZs58r/HhFE+OzQqI6F2ads9y0PXgpFZCCSC7t2IhR/4oWaj
 pW4TLAwOTdfJIwya0bFGpofW9BQsOZoWLSqzSM7oikPnwMJXk+DM3pwWfovVM13X
 PfUN/xEWRxcQRFiEChGbVMFal4jEttxpvQpFn0MfU4Fi9JAYRksmxZeP3BbeY7g4
 akjpH0VsAcExpYxgn6tOQKilMORYQx85fVwZKaI7mS5pS6TmpD+ZuZbUtRhRS0pZ
 WLRZKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga0wbre5g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 15:05:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-936708f129aso63666185a.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Aug 2026 08:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787756710; x=1788361510; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ivHQtH7J1gihc5fUm7h5lY7upQT/cUC9c8mXJEgbi7I=;
 b=f9aSNMs/1Vn4/yd84Q/obcRrhUDZFS+vVgV3GJL8E97amgLM5yg+RrmGVOsJXdC0n/
 5X4BhmHvDZjamSEYivp1vsE8jWMZ4vpklNqWOvEY3+Fbser2nAgjoj/pP9t6nNVXbelD
 y+rR46gZfICysa0TTYAIxEbvy/j5ZhrnWqIA/w6ViMPpJ8JJMKZIc+cO80gxp3ViwE/X
 u8RG4fTcwcfjdxNHeqvglWd6EKfebF1i8QdovJjqOx1yst2Ox8T3ccuICirwz97Vym23
 IN148UG6nDQiYxkJy5XTyBswmx1EQNsuXH62rItuOHyAR1a1Oy5o483MDK//0KeB7UyN
 YCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787756710; x=1788361510;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ivHQtH7J1gihc5fUm7h5lY7upQT/cUC9c8mXJEgbi7I=;
 b=M2FbpCAw572g53D3L+2Y8jCprWicn3ImpDJIWD7tEYUIUXv6l2wGjPCcfd+SaVMTc7
 ai8EIfIvgMuE8E8zd0yHQfxRs3ZRH+vIiRe/A7v6OmsNROz0LRdefq/YC8W/R3pCL8kk
 zfXD1ldOfN5VE22jMGx3ByDg+c44wmthp2hLvc6xVNBkjm0DXYwVuKrRYksItJaSXIbA
 aq8NEQ2cXtdw6gw6tpU0lJ96mwbgupwumArTk73qiIV/n4VkHB+GmLhaJJd5b9WIB0x/
 Nof4VdDmokcRUVl2ompwmmNaZNkWFjQPDHWjQbuOPG6P7LCjqkdwzC1ks0eXZMKPlxyg
 0O2A==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro9PYpNb4A45/gPKfbFzh7N7KZeNt8BkqJEqooRGZigMK8FB8h3IDJk12j8a5gZIXLxR+QyWisPcXAl@nongnu.org
X-Gm-Message-State: AFuF++npMZmw4YjFMJmCRd3aEwntMzaJvwNXmnq1Oqivmt6f43lOpE3k
 HdGQrUFv4CYasa++37oDlBvGyF6O6OT2HViYsX0ptS6rA80UJo/VS137RvqBlelzYkxbce/sGTY
 HMwPVGdj/d11l02v5aF3Sn7mtd+0z3uQUT2h5soD3w6BP1Me7PFOInvEg0A==
X-Gm-Gg: AR+sD11j4DHhUThl0bGtTQFk7rdu08GNsF3RzW0P/K0fBCWFWB3IvPgpIPqYm7qMqnW
 JnGXhlKgJGvjP9OTgq9qQ7trbzeRjYgRZO0pDojA4Bdevu8rph65h+eRJq26ijwwzUQ5TxvNZVr
 lVyYXqJD50JSFF6D/CDHsijtIPYlextRc+Hvv1Mfoh/wBbluie1mut7Zsv5xUDZjsAaqpDPkpjs
 cHcgDd4qMa6/h6ddhrDXYGx3xIcoSsMC3zzlBmFqDeeME/t1gbKANPvBNngfm2BEIrkZmBLod/9
 x6wMtxAViHtf2oDXNgYx68+qxWroq7u+wS3wHE26ZAPO6p5YYak0gML6gxYTLJrtwJY5YKJ0CpF
 2jb44Gn8u/fvxYMZMdTdhLbris3lFEZxM12qG
X-Received: by 2002:a05:620a:269b:b0:938:fc91:8072 with SMTP id
 af79cd13be357-938fc918a1fmr173720485a.18.1787756709641; 
 Wed, 26 Aug 2026 08:05:09 -0700 (PDT)
X-Received: by 2002:a05:620a:269b:b0:938:fc91:8072 with SMTP id
 af79cd13be357-938fc918a1fmr173689785a.18.1787756708083; 
 Wed, 26 Aug 2026 08:05:08 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9377e688b35sm225104785a.41.2026.08.26.08.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Aug 2026 08:05:07 -0700 (PDT)
Message-ID: <f972ec37-676c-42d9-89f0-05879713f75c@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:05:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/13] hw/riscv/fdt-common, virt.c, tt_atlantis.c: add
 create_fdt_uart()
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, Palmer Dabbelt <palmer@dabbelt.com>,
 Joel Stanley <joel@jms.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260825212326.1907-1-daniel.barboza@oss.qualcomm.com>
 <20260825212326.1907-9-daniel.barboza@oss.qualcomm.com>
 <CAEev2e8fbPt04kcKh5a+ohXYtWPzC5-cD58gcMFS-NV3QQKwSw@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAEev2e8fbPt04kcKh5a+ohXYtWPzC5-cD58gcMFS-NV3QQKwSw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 8u0LaqgbpPvLbiYJseeYi7pXf8_mRs8O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEyNSBTYWx0ZWRfXwVoT3/LohMJX
 SALHbNHShIWdpyMb3FtAlMSnQ2heP3/f0uzQgcSzyMpCJL2/K90dkQGi6HpQGNAmFbwMG95bK4d
 tltWEaEyBSsrDCNQynPovTlRyKJeGgk=
X-Proofpoint-GUID: 8u0LaqgbpPvLbiYJseeYi7pXf8_mRs8O
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a8f00a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KDr9JptfNnerHhvE1wIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEyNSBTYWx0ZWRfX5Ho700dMhRes
 matMpn4r3I47lX2T7BldjhiAVet3fJJGm8Ko1uaZdlS1oygbd1qNErkGXviE6Rq0HdP4hPvwnr4
 aPxnHpw2LKWsvHIEoi8C5kPEhXAQ3GI+Sp8XJmBRJpXNYYxtE6Z0GbfC6d6wWR5uEKWtwjniZu3
 U2GJuie20qOfdzwBxUEXeYIY+Tdv9Dq3a9TX0sECVwJqSGHII718FdnaKgukeJNXCn+juv5GCju
 bvM44qxcPMfr7sWy603kv7N+nMycrCtpfu4DiNxiRyGRKpL89IAmrbcfVmDm5tu3qlnGoqXMh+i
 8oK7AaSwIwoP5YWJ1zTlgT6EnJ0IvvTp67G4JKEnbuaNrR/IRkni1b5oXwOQdEknP8XZfuoCnrz
 Mzbkuq6JfSbE9COvAhtRNl+yWiw1xjtUzx+07bKQmLNY6asXQ61heY/ThkIBZxo+4CjTsjb/rvq
 dc+aNh+z6xpaLcrwBhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_04,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260125
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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



On 8/26/2026 11:53 AM, Anirudh Srinivasan wrote:
> Hi Daniel,
> 
> On Tue, Aug 25, 2026 at 4:24 PM Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.
>>
>> To accomodate both boards the helper is doing the following:
>> - an 'additional_reg_props' flag is used to control whether we want
>>    'reg-shift' and 'reg-io-width' elements added.  OpenSBI won't boot
>>    with the tt-atlantis board without them, but 'virt' can't deal with
>>    them being added unconditionally either.
>> - an 'is_serial0' flag is added to control whether we need to set
>>    additional properties related to the first serial.  This is required
>>    because the 'virt' board adds two uarts in the FDT.
>>
>> No FDT changes intended.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> ---
>>   hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
>>   hw/riscv/tt_atlantis.c        | 21 +----------------
>>   hw/riscv/virt.c               | 44 +++++++----------------------------
>>   include/hw/riscv/fdt-common.h |  4 ++++
>>   4 files changed, 52 insertions(+), 56 deletions(-)
>>
>> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
>> index f31cc9d3cc..b3f3af3762 100644
>> --- a/hw/riscv/fdt-common.c
>> +++ b/hw/riscv/fdt-common.c
>> @@ -791,3 +791,42 @@ void create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
>>           g_free(name);
>>       }
>>   }
>> +
>> +void create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
>> +                     int uart_irq, int aia_type,
>> +                     bool additional_reg_props, bool is_serial0,
>> +                     uint32_t irq_mmio_phandle)
>> +{
>> +    g_autofree char *name = NULL;
>> +
>> +    name = g_strdup_printf("/soc/serial@%"HWADDR_PRIx, uart_mem->base);
>> +    qemu_fdt_add_subnode(fdt, name);
>> +    qemu_fdt_setprop_string(fdt, name, "compatible", "ns16550a");
>> +    qemu_fdt_setprop_sized_cells(fdt, name, "reg",
>> +                                 2, uart_mem->base,
>> +                                 2, uart_mem->size);
>> +
>> +    /*
>> +     * The tt-atlantis board requires these extra props in the
>> +     * DT, but adding them unconditionally will break OpenSBI
>> +     * for 'virt'.
>> +     */
>> +    if (additional_reg_props) {
>> +        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
>> +        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
>> +    }
> 
> I think the issue is that atlantis uses a uart that has 32 bit
> register spacing (0x0, 0x4, 0x8, 0xc....) rather than 8 bit spacing
> (0x0, 0x1, 0x2...). So rather than "additional_reg_props", would a
> name like "word_addressing" or "32_bit_spacing" make sense?

Works for me.  I'll rename it in v2.

Thanks,
Daniel


> 
> Regards
> Anirudh Srinivasan


