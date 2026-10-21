Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA76606A31A
	for <qemu-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 18:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ilAwXSTu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i92Rqfhn
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xJbAN-0000cE-Q2; Wed, 21 Oct 2026 14:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJbAK-0000bE-Fb
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:35:56 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xJbAI-00027g-Si
 for qemu-riscv@nongnu.org; Wed, 21 Oct 2026 14:35:56 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 69LHpRe4996551
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2hVNjtHuSlv2Dnbiq2xJsihuQ2Tal8Cr9fT/Z1dg3ik=; b=ilAwXSTuXp7c1nF/
 24bOREMIQa9VISJnSzaHKfrpQXa+ed4JwU7kDZp19G8Ij4TwADicreUqPzLuL5zi
 a76THVOOSCos8WBppNB6rVATjIfbObNfhwWacoQhaLhZYLUoOm4XZ9M22Utr+ju9
 Qmn/Mt646xWg1BmDBleTXhZAo3QFoFLu1HqZGsgUMBfQhGSvExM6ZV6Aq2TLWApO
 5OWG84YTYQEALFtWNCZ1yL0UQTkHS4jpwpwHnUqdvmOiPKoOpSkU6RjG6k2/pQq+
 W9OJ41eY49G6axmxit5Skwj+y3V3E0h7REhXy+PniZOX2xVTx8or6ehNBU770MzQ
 /m/u+g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex7vsc9x-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 18:35:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-536720195ebso21593651cf.1
 for <qemu-riscv@nongnu.org>; Wed, 21 Oct 2026 11:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1792607753; x=1793212553; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=2hVNjtHuSlv2Dnbiq2xJsihuQ2Tal8Cr9fT/Z1dg3ik=;
 b=i92Rqfhn5OJQT13oIRQZ36077DreEteT/Mu1nplS3VKVB9m59BC/FPy6mbhew5X/V8
 E2c+IZJWA/CoPDnSAKrI/WFblQqjxdXJbqY1KWZ24EnDslw4VwLp49T2aAzefQR2zf8K
 vFwSSKmvS3zjDKyVEqn6bT4g5lPyqFWQRqOLdmyTcq+BfdxFJZelJfOeVqvtZrYusfcn
 /G65KAopQwgHQhPrD3t/yVC6xArHzOCA7L0sLQuCMUOPBWvU88Ft3rE+UVS5aCyfx4P3
 SUCgl8arAQ9+lU4RM3hk1f6Pl2Yu1mBULvAkSzem9yTRGfAIQBP0VbJ919CtF9Jfx+TK
 XpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792607753; x=1793212553;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2hVNjtHuSlv2Dnbiq2xJsihuQ2Tal8Cr9fT/Z1dg3ik=;
 b=2Jfmy7Umks1clxDrtHXEABMP/+RoCVe1WV+/ZwwSFAQOpjjfLZ06/1wpSpZhZh3Z7/
 VtbD8oh629x27ebPzuGBFYCIQS97Wrp0UMK/4E/Q4Fnw02u+yoixX3FVFt+W3z6QzA4m
 fnq7VmX64CqYUiOclAUxhbJC7fV8bseCsn+mzxT0v64VVg4DAMaQ0B2pmwNH4HCBU1JC
 retbLC75se8AWkbgLfF26/EjssZJ8XxmuvgZYq6TVizPGfMihG0hKeldMkhei+zy8pHF
 aOEvwJpMmjU0MhS4BNMcx/RWoqSkVRBdHMSWX+SVLGNY6vJcpjk41G1b82D3+HwI2hbB
 eOeg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx1vd8u7CWTeGXF1vK7Otuje7fjfcGxfREcpZFnTxWNZ6Bg5Y2TzW4XwEgNSXcpoMUk9yro34ieUW4T@nongnu.org
X-Gm-Message-State: AFq9FYK7f1YKW/qqrJwAsDuIOTz5IYai81Zi9VPILVE8nKOS0Hbrwa1q
 PXD/LHeyjsGU5caNtoX62Vb2Zkt8Ux+GvpnQcndj/oAhcHc6Wq5kOr4Y870YJw3W3WNm/4rYC26
 z5c25H4biYvT92plZ1uFIv6liYEj85CBU4ykYWn+//TgqBG0B70tZ0iu+aQ==
X-Gm-Gg: AYBFou05vCbn+lNQYNhG8p0K5gCYkJo/VXOq58G2rxi1XaiinF1GR0nvYEoMXYKIo4v
 hKwMupZ48VQvyweZh6cUGSR5hgOBc2UKJvtpW/OcpXRwR8CRJoIPr6A5AE/gc0dmGuhX67hNfe1
 +8QlNGTMW5FOzqdOJvsvs4Nne+vWqSXb1FVTz0Fi4HzXCoZNbh5KgfSf4JOJRfsOhSK54SGC5LK
 LfXVKc3C3J9a3GmupvFjLUJrFE3HV+YRtfi7A1XncJa8/FG1+EZPq43GIYDSQSyuIwOrzc7rVHX
 +HAXWbHXSyffP4fulcnZUTdmIU7vzjzfj795uaFm/WX9FppZBltyDlH58XD4TiWYyyQqw9lIjA3
 ZULTG/qiKzpNVOcIFFr/OGGJAZO0Z5UNvvQxU/tfgwx582wlvk890k069m5F5aWJT02GOI3JW
X-Received: by 2002:a05:622a:2488:b0:535:84e7:5a82 with SMTP id
 d75a77b69052e-5369bb287e1mr44248441cf.55.1792607752920; 
 Wed, 21 Oct 2026 11:35:52 -0700 (PDT)
X-Received: by 2002:a05:622a:2488:b0:535:84e7:5a82 with SMTP id
 d75a77b69052e-5369bb287e1mr44247991cf.55.1792607752316; 
 Wed, 21 Oct 2026 11:35:52 -0700 (PDT)
Received: from [192.168.68.101] (200-204-190-237.dsl.telesp.net.br.
 [200.204.190.237]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c1f77518bsm7728426d6.31.2026.10.21.11.35.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Oct 2026 11:35:51 -0700 (PDT)
Message-ID: <5755c021-5c4f-4957-ab9f-e32be1e004a5@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:35:48 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] hw/riscv/virt: only describe PLIC contexts that
 exist
To: Ralf Ramsauer <ralf@vmexit.de>, qemu-devel@nongnu.org
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, Bin Meng <bmeng.cn@gmail.com>,
 Lukas Landgraf <lukas.landgraf@st.oth-regensburg.de>
References: <20261021110838.3097959-1-ralf@vmexit.de>
 <20261021110838.3097959-3-ralf@vmexit.de>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021110838.3097959-3-ralf@vmexit.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aQaNvsNZb7-_Lvn7nEUCMd3PI8KrlShy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA3NCBTYWx0ZWRfXyN0O1HH+m0hQ
 wQ4Qgt+8S0ERPU4JgnyWW5Vm5Cu+y6cvcyZyNWpviPao8zHQRMZdpgCYIjwuybk0qWd80jAHhWu
 9fMw5ngAozX+f8yF49UvxrzAa4mOW3s=
X-Proofpoint-GUID: aQaNvsNZb7-_Lvn7nEUCMd3PI8KrlShy
X-Authority-Analysis: v=2.4 cv=e4uT2qp/ c=1 sm=1 tr=0 ts=6ad90609 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=QmVDPCq3bE4LYXGvZ20s0w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=loLN2dJ51w1iObKrfQgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA3NCBTYWx0ZWRfX/R66RMViSAfN
 u8MdiMAcQ7Ad3xZGb3aS3BqeiZ0B4dJ4z38nPH6mtvXusU+aHGqS3F8ePYPZolHyH84nk1htwEq
 X9kjrw5qSMEJkTWpA9nMXNpZjseVAo62HxdICnQqh9D2JU3e/N0qNq/e5t/D6v0EnshDVWr2Sp1
 LyAizPcaD9BjWAZUNDlVt3w06jmEUuaeoStYgMPxvmOrEb2JCj18ItO8nIl3aYT2s5q3OAqN77l
 vyrtCLSW3XB/yFJVLp0FkBu/VJPYbHQV06rDDK/T3Hh6ZzXh6lpi6xYYewWf9yZz8iXhNousul9
 oTyDdtYl0+ecsSnbcg4VMLn5oTwaMATtFnOzxzfynFkNsdiNDWa99X5+WvTNyZrLY1ciL9RpCD/
 DMqfTv6CxmoCqpkrW107Hre720fI869uC78mA6HPaCFzFqwZBg1qHQwpKI7+GeJU4yQgV7zqclE
 H5j1jQlNU5QYO7zvyag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210074
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/21/2026 8:08 AM, Ralf Ramsauer wrote:
> From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> 
> The PLIC device is created from the topology string built by
> riscv_plic_hart_config_string(), which gives a hart a supervisor context
> only if that hart actually has supervisor mode.  The device tree, in
> contrast, lists a machine and a supervisor context for every hart,
> unconditionally.
> 
> The two have disagreed since commit 7d10ff8a4d ("hw/riscv: virt: Use the
> PLIC config helper function") taught the device about harts without
> S-mode and left the device tree behind.  Boot with
> 
>      -cpu rv64,s=false,u=false -smp 4
> 
> and the PLIC implements four contexts while the device tree advertises
> eight.  Contexts are numbered by their position in 'interrupts-extended',
> so a guest that takes its context number from the property gets it wrong
> for every hart but the first: hart 1 drives the context of hart 2, and
> the upper harts address contexts the PLIC never created.  This is what an
> M-mode kernel on the virt machine runs into.
> 
> Emit the supervisor entry only for the harts that have supervisor mode.
> The KVM case then becomes the same rule, not a separate one: its harts
> have no M-mode and always have supervisor mode, so the common loop
> describes the single supervisor context per hart that it used to spell
> out on its own.
> 
> Fixes: 7d10ff8a4d ("hw/riscv: virt: Use the PLIC config helper function")
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

> v2:
>   - ask riscv_cpu_has_supervisor_mode() instead of reading RVS out of the
>     hart's CPURISCVState (Daniel)
>   - fold the KVM branch into the common loop, it describes the same rule
>   - drop the claim about sifive_u from the commit message, patch 3 fixes
>     that board rather than leaving it as the good example
> 
>   hw/riscv/virt.c | 28 ++++++++++++----------------
>   1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index d4b501802f..a2851b506d 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -156,23 +156,19 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
>   
>       plic_name = g_strdup_printf("/soc/interrupt-controller@%lx", plic_addr);
>   
> -    if (kvm_enabled()) {
> -        cells_length = s->soc[socket].num_harts * 2;
> -        plic_cells = g_new0(uint32_t, cells_length);
> -
> -        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> -            plic_cells[cpu * 2 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_S_EXT);
> +    plic_cells = g_new0(uint32_t,
> +                        s->soc[socket].num_harts * (kvm_enabled() ? 2 : 4));
> +    cells_length = 0;
> +
> +    for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> +        if (!kvm_enabled()) {
> +            plic_cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> +            plic_cells[cells_length++] = cpu_to_be32(IRQ_M_EXT);
>           }
> -   } else {
> -        cells_length = s->soc[socket].num_harts * 4;
> -        plic_cells = g_new0(uint32_t, cells_length);
> -
> -        for (cpu = 0; cpu < s->soc[socket].num_harts; cpu++) {
> -            plic_cells[cpu * 4 + 0] = cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 4 + 1] = cpu_to_be32(IRQ_M_EXT);
> -            plic_cells[cpu * 4 + 2] = cpu_to_be32(intc_phandles[cpu]);
> -            plic_cells[cpu * 4 + 3] = cpu_to_be32(IRQ_S_EXT);
> +
> +        if (riscv_cpu_has_supervisor_mode(&s->soc[socket].harts[cpu])) {
> +            plic_cells[cells_length++] = cpu_to_be32(intc_phandles[cpu]);
> +            plic_cells[cells_length++] = cpu_to_be32(IRQ_S_EXT);
>           }
>       }
>   


