Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 920ACC61DC2
	for <qemu-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 14:03:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wzagh-0000HF-3s; Thu, 27 Aug 2026 10:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzagf-0000Gd-Rk
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 10:02:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1wzagc-0003I5-Iv
 for qemu-riscv@nongnu.org; Thu, 27 Aug 2026 10:02:37 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67RDt46c3695741
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 14:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cTmnMWLfRpX+uLhk7JMygvPAvsqG3d1g1cep4nnwmo8=; b=FSlAnJuSfiTR794O
 cVw3iMPEAsL/83lnUduJPCrP5yXBJe3+yg53BOTxpV8M38iIRbBHCLWiFUw3mxZh
 1C6UBAU7NieV9MxASQcl/24EdcGkTQdTF79fxn6Nh/k8DLpbcMnMr2GrSteCVATD
 omoqrd6jdyBKm0zfxsZQV6cdPznI0Cm9EUSzWlZAYJy/u3VU3MNKVztERG4YmWoI
 vneqThnhURZthWENi9HNmOp1UdgHMwhznZl/mZubxamYi2pcigiVEaGWJmRImPRo
 g5j7THro4+6wZ/zkdJQJlQPSFNk2Cb/mMP7wPxzj8o5fHK3aA/suaND0zsNtA9SV
 9+W3cg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw0156-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 14:02:29 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5bbd01d56ecso343276e0c.3
 for <qemu-riscv@nongnu.org>; Thu, 27 Aug 2026 07:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787839349; x=1788444149; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=cTmnMWLfRpX+uLhk7JMygvPAvsqG3d1g1cep4nnwmo8=;
 b=Zy5X5DAOWO6ZekejgamPFqeOJs3/byZ+JGK2x8AFVJyGJb2Si5e4ICol5ARpuw7z6z
 vKfVHmD8jqGw6DniH5/Pz+lIAd40ZngGc1AT7z8eHPk9CiGycsdxDUFRr9IwfbxSEtua
 lc9Ah7lwSthcurOKv0WztoBjF+EcQeuML6z6AgrQASsn7mGoJ8bEtahsqgafyH4Atr3D
 ZLA0hCZBOnb3pDudBfZdOryUphutPOgGVBxqADpFgAEFyrCjElezmYQqECOuOAj0FhbQ
 5jGlzVT+hJyPQSg+2ITYmNVnjr/mvxp3gmaF1aWDOWrmbEyBIP1X0tVdYjWfSCmwj1Wd
 vjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787839349; x=1788444149;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=cTmnMWLfRpX+uLhk7JMygvPAvsqG3d1g1cep4nnwmo8=;
 b=cdZCevoFX7ny0BR5khdqORzDBtUwDTr2tJwKCudnbYTTMIkLHEUm0VxHQL5/aUf6qy
 MOXBU3Y2vECHEzz1693A3FYRBQTaK2M5P+E9W4TXO/D431cPYo/AL2JezO44CBWuXLLU
 LZEkorGfnQA9qIGBkaGx1L9IcA4aGyCQ+ZYmoFiDYBKDURzPk2CRORtW1/yB8cnze6mK
 FplVP7j7efzKyc8Q4WMuNuC3xehgO1QYllBnGGsyCWJusU30x9bPhieqHo7SOARFmRkL
 UorAaPwN98x7ObwhU50Ilc4Hpwv3MkwdcHGpj25YLDr6YaJKPSQ+mk8ti5ldPCGOEMAE
 P+fA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqrqEaVkjJ6ax2n+jaWEoNkADw4JV6zYR2cWnnDhE7MLiOcjxsTlLqW6I8YBaH1TdpQUDXdT0MvXIj/@nongnu.org
X-Gm-Message-State: AFuF++nNjQh5J4F64nSfFhV3DkuyJxUgj9h42wHmjQEghQsKBy/B4kM7
 9lP0xgOa8n1/k0pCCBNdpcY6FRDZdfQv6cSRUTitDW2yZqfT/c4gnPhsEhoBbLeEA280jTrqzb0
 CYF59A2Q1pswH/9Xq7dtHqm6vx7xPseZFjWR12yPhev4HoZZoOJEphF55kg==
X-Gm-Gg: AR+sD11prgtyBOZyuoxrWvd55DhUjDTlMNRJjAkRzO8CWxGAtx/wwKAOuVVSJMS93Vt
 /jMabHfbsE8pdJFzMnYYIXUHcPrHUqVKkNQbSRRMVRqq8Nsb/DuIhsOfKFqqL9+h7XfzJz2HSmo
 1HwQ1oNtMWjNlot6mGQ5gFrg7rBU5yDXAVUlbDjA9U9EKlSItUlq+sm7CjbVXeIu+FK8g1lheU+
 cDtg2MIcmHUi0pr0DgWoKYAsTMM1P/xYnw88xYNCPhoQCbTcBVLBGzzhx/UkKbHX2snFZjSSX+w
 SP85JblWaWFNkXXs/L5apE2UgHAW3WK8BSceac9hQPBXa681l8DYphdXZByU6JL0p4nEw/q6Fmn
 Ax5xgqakCvLX10138BljFK/azV8oldbybuGm9
X-Received: by 2002:a05:6122:3285:b0:5bd:b2e1:e1f5 with SMTP id
 71dfb90a1353d-5c65b9d67a0mr4718450e0c.2.1787839348882; 
 Thu, 27 Aug 2026 07:02:28 -0700 (PDT)
X-Received: by 2002:a05:6122:3285:b0:5bd:b2e1:e1f5 with SMTP id
 71dfb90a1353d-5c65b9d67a0mr4718342e0c.2.1787839348247; 
 Thu, 27 Aug 2026 07:02:28 -0700 (PDT)
Received: from [192.168.68.100] ([189.38.141.232])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c250a5d671csm698808466b.3.2026.08.27.07.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Aug 2026 07:02:27 -0700 (PDT)
Message-ID: <8173990b-ae96-4345-84d7-9475608f94b2@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 11:02:20 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/14] hw/riscv/fdt-common, virt.c, tt_atlantis.c: add
 riscv_create_fdt_uart()
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com,
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>,
 Portia Stephens <portias@oss.tenstorrent.com>
References: <20260826214643.122728-1-daniel.barboza@oss.qualcomm.com>
 <20260826214643.122728-10-daniel.barboza@oss.qualcomm.com>
 <CACPK8XfRS0KCNshf88Gc75=E8V7qKUn_ywFu=9qv-7Jgfu8k-w@mail.gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACPK8XfRS0KCNshf88Gc75=E8V7qKUn_ywFu=9qv-7Jgfu8k-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -SxsoMcjXrMD88ok163atHu73-xzL9hC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDExOCBTYWx0ZWRfXyTeYObda3xWE
 CW5vDp5AQ9ru5yCiMtX18BQg0S8/SozqZRmpEZIqOCqB5ueRByyJ6qy7ScoAtPpnfJ45XFdqyKA
 TftwXxqXmkw02Vu+3x4U4JHt95Q1Zjc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDExOCBTYWx0ZWRfX0EDYtPVrJ5ZP
 kBkotgLroyJTqBI1VELrDkakEqm1ppi4wxvbqWc0SJqjEdwOroFMMUyEtf+/OgawnraRjLze3yr
 qaeQSDDHYHbVe0+bmjaYXHbDpvsh+SwlzAy7x4/15AkjVYaVJ9pmoo/eJWeHHyPQ++GX9cEIga2
 ALkM+p11Dp+E0ChlyqcsASfNpc3pqVWzvRoNfEbCmkcbedxf8YPtFO+bB7bCUhJgwvMvQacrQDd
 aaOzKa+CRikRBUCX6iRFa8EuuWbwi5Gbi6vE93r4aJAPewti1x/tKl5LE/GOc5Y2QAcnJ0TIlwo
 qM6yFkpi3XSSirhTHqtF1Lo1RjCG2yDHHfF6vlw/oP1fY3+Tb2pJqC8Zmtju1JDhMTr0If8MiKy
 C8HoEtSG5hmuqG5g2A89qQjRPiJUZ29pFLeYbAPLG2/WNePBHmfGcDJFUhhg3eSONg6HQeh9Ogq
 T37zCiXfueLw0ooMZtQ==
X-Proofpoint-ORIG-GUID: -SxsoMcjXrMD88ok163atHu73-xzL9hC
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a904375 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=MCIxunHWmQOg/5OnbzXZaw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9496tuAAAAA:8 a=1ejmK-093Ji4hAkYRu0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22 a=4wQ91nGE5lQcD7eh5OX0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270118
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 8/27/2026 2:38 AM, Joel Stanley wrote:
> On Thu, 27 Aug 2026 at 07:17, Daniel Henrique Barboza
> <daniel.barboza@oss.qualcomm.com> wrote:
>>
>> Add a common uart FDT helper to be used by 'virt' and 'tt-atlantis'.
>>
>> To accomodate both boards the helper is doing the following:
>> - an 'uses_32_bit_spacing' flag controls whether we need to set a
>>    different uart reg spacing for the 'tt-atlantis' board;
> 
> Once the designware uart is merged, Atlantis will switch to using that
> as it matches the real hardware. As part of that we will switch the
> compatible too, and at that point it might be best leaving it in the
> board file?

I wasn't aware of this info.

I'm also not sure what you're proposing here ... are you saying to leave the
"compatible" out of the helper or to leave tt-atlantis out of this patch for
now?


> 
>> - an 'is_serial0' flag is added to control whether we need to set
>>    additional properties related to the first serial.  This is required
>>    because the 'virt' board adds two uarts in the FDT.
>>
>> No FDT changes intended.
>>
>> Signed-off-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
>> Reviewed-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
>> ---
>>   hw/riscv/fdt-common.c         | 39 +++++++++++++++++++++++++++++++
>>   hw/riscv/tt_atlantis.c        | 23 ++----------------
>>   hw/riscv/virt.c               | 44 +++++++----------------------------
>>   include/hw/riscv/fdt-common.h |  4 ++++
>>   4 files changed, 53 insertions(+), 57 deletions(-)
>>
>> diff --git a/hw/riscv/fdt-common.c b/hw/riscv/fdt-common.c
>> index e6bb107309..fb7098f213 100644
>> --- a/hw/riscv/fdt-common.c
>> +++ b/hw/riscv/fdt-common.c
>> @@ -795,3 +795,42 @@ void riscv_create_fdt_socket_aclint(void *fdt, ACLINTFdtProps *props,
>>           g_free(name);
>>       }
>>   }
>> +
>> +void riscv_create_fdt_uart(void *fdt, const MemMapEntry *uart_mem,
>> +                           int uart_irq, int aia_type,
>> +                           bool uses_32_bit_spacing, bool is_serial0,
>> +                           uint32_t irq_mmio_phandle)
> 
> What does 'mmio' mean here? Perhaps irq_phandle?

This name was inherited from 'virt'.  I'll change it.

> 
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
>> +     * The tt-atlantis board uses an uart that has 32 bit
>> +     * register spacing (0x0, 0x4, 0x8, 0xc....) rather than
>> +     * 8 bit spacing like 'virt'.
> 
>  From a survey of the linux source tree, most machines use reg-shift=2.
> If we adopted this for the virt machine then you wouldn't need to
> special case it, with the side effect that you'll match the layout
> more likely to be in hardware.

I am not sure if we have a demand to change the UART for 'virt'.  If that
ends up happening then we'll have to revisit these regs.

> 
>> +     */
>> +    if (uses_32_bit_spacing) {
>> +        qemu_fdt_setprop_cell(fdt, name, "reg-shift", 2);
>> +        qemu_fdt_setprop_cell(fdt, name, "reg-io-width", 4);
>> +    }
>> +
>> +    qemu_fdt_setprop_cell(fdt, name, "clock-frequency", 3686400);
> 
> Hmmm.
> 
>> +    qemu_fdt_setprop_cell(fdt, name, "interrupt-parent", irq_mmio_phandle);
>> +
>> +    if (aia_type == AIA_TYPE_NONE) {
>> +        qemu_fdt_setprop_cell(fdt, name, "interrupts", uart_irq);
>> +    } else {
>> +        qemu_fdt_setprop_cells(fdt, name, "interrupts", uart_irq, 0x4);
>> +    }
>> +
>> +    if (is_serial0) {
>> +        qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", name);
> 
> This is related to but not really part of the UART. Should it stay in
> the machine, or be present as a separate helper?

We could move it out of the helper but then the board needs to deal with the
nodename.  I'll add a "riscv_fdt_serial_nodename()" that retrieves the nodename
given a certain 'addr' and then each board can set stdout-path as desired.


> 
>> +        qemu_fdt_setprop_string(fdt, "/aliases", "serial0", name);
> 
> How about passing a char* alias, which can be NULL:
> 
> if (alais) {
>          qemu_fdt_setprop_string(fdt, "/aliases", alias, name);
> }
> 
> ...might pay to check that /aliases exists too? The ordering was
> enforced when this is part of a board, but now that they are APIs
> called from anywhere.


Since we're taking 'stdout-path' out of the helper we could do the same with
"alias" too. I think it's cleaner and less error prone since the board would know
whether "/alias" is already created and so on.


Thanks,
Daniel



