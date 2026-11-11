Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4333606A31C
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 10:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TzbImpf0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V2pTI3zi
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR5bx-0005Iw-Ep; Wed, 11 Nov 2026 05:31:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR5bj-0005HR-6i
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 05:31:12 -0500
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR5bh-0001sS-JK
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 05:31:10 -0500
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5Kg7e300701
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 10:31:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PTa/Wj6HNlsl/nmOa+sVKnuyot8IaIJcCJ3AwH92Hk4=; b=TzbImpf0+NribJYm
 E1YBkRxDE8P56OmFsnonDP3dacP+uZzIVcy2wOCl0VMfqIyFLTQ2QDuSf3REph4C
 dpl3y5+GWoLfz5+Dl+LQXqvNo9cFSrcTHDnwwIbUKBXLBXr0sPRryvRN8pVX1+OE
 SqI6HNiig/kWVkQuvrIqURlZyiPF0w0iSCTj/4HwG6iTicLdVJToA4aDjJremCqa
 G7OoLkN5yiJ/HFq8SJmEHNLsuJ7xuUkMjMY2vRrXuFZ5HOPMY9VShBBC97xs+k6e
 mi7WBFY/ihsiTIHN1IeQRB+zMLOskhFvhD8s5vKf7QRTlbPoTDi7YkLe2MQ3MIzV
 3RMKbA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv7c5ktkc-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 10:31:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93f62934ef6so690065585a.3
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 02:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794393066; x=1794997866; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PTa/Wj6HNlsl/nmOa+sVKnuyot8IaIJcCJ3AwH92Hk4=;
 b=V2pTI3zipPEhrF/uL/kvWZUMaT4/sYzKaCifd6ncBTibCMcyuOK6Cf3kFhSM8136mi
 iyUQ6XiAO+QQ07UwLhlC6vo3PD76h74dMEES/rLaYVyfzRYJnMTGq0rp7nPk2qTDklhs
 3bVFUBbdmlvSCIxH85NevosoCFq4/biESZW1wfoUwpKvhX4IJucZhMXSg5m/sz0RT6Qk
 6XtW9ei0LNV9KUi6BSMbVyASBPQ+MxFv7Z56gNV4SuBnhV7weZXH7ZH/Rr+FBA5oOQ20
 ln1CRAxddKDGD6M7R78FGR9bo90gSfDNURRQcpo5EufjAkIkMqe7Pv++uxa+x9LgHj59
 CQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794393066; x=1794997866;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PTa/Wj6HNlsl/nmOa+sVKnuyot8IaIJcCJ3AwH92Hk4=;
 b=0AaYgSEFhpCTGqambWoL684YVG9trhd4KosKBnXULofdIw1v7T8hFQLFzYbOlXwZd9
 mbVu9QNq7kW+0GuprMLDtNtbMWsMIRmMdkjElMCWFWuwrvrHt6sDQktUFk5OqJCOZGln
 UqXfa8hVAUF7u2L2ZNlUmMXr0cf5tMRfVqwrf8RCFzHScAC0RG6mPHhcXV0wzvD1VbjJ
 Kid5aJMk7OWOVZAIxlMUgi6MfpmVyn7kx41XBjhYEVhnqJlWuy0W0uS2Kf5pG9gxplzx
 7Nr4dMqHFAZNpicE/OSeEgNOBNjWOlT/qTLuxHLJ3uKl/fOyY9Ue9f/dKx8tATElvsqn
 415Q==
X-Forwarded-Encrypted: i=1;
 AL+hErEUc98cVFq1f9JJ3wTevdVCxljY8Gj5VRUTfhjxMnqgXgP/j6uHjZCdJGrP3WrP+SqT9karxMqYQWIj@nongnu.org
X-Gm-Message-State: APuU4Z/BSu6Nv+rUt013CWp046wxjbehhw0HGNAg/65P1poVlLW/L1z3
 GABWZ895pig4FaIBk5MeBRKNqdLgsdxvV7mXaFp0typXyLZenYoO4Skfw+BvtIJBPPhKYHmTBTI
 y+i5NYS3/Qs4A6bDDU8Amvs21zN8+D9oev4fdu19YOlElhWMQvaXHsEqUjw==
X-Gm-Gg: AYBFou0R55NJwvuG0SY6c6h5SIteX43oWP27ZNUMT5wmobxKq/hZSZp3hVvdrWZZhHT
 ZGb47A81L4jOKhWUj9WRUQpa1cyncLKfz4xLt006M7ltTx4ZzkBcyrgbevL4ovccSRNcEISUAHo
 HGrPvOoMFBPmXRIAzwINzq38YA4Dcie0FvcFVZZJ5NNKkWMta7LNj4qvwjvALfRSvOYl1Sh7e7X
 w6T14XmkZMfAecWU0A1HNtUL8KN8AYqdYd+Zlq2rPs4VDh9rBkWCTOozq+/i/wxoLb5ghtrP8IB
 gUz68xZf5ubAFO8EkynHxO91AkAgGZx4L2JYVSo8HeYMMzIIKx6YxK7lt7D5uCrzRuYVxWw8QC6
 r0j7LVSM4aVcsxKch8MhOpYsjIgQUMiR3vkB/Vb75IIlUPhbdKKliVa1wjwytIkT/wUT+Tp+b1m
 +1+qqgbHF/BQ==
X-Received: by 2002:a05:620a:3710:b0:93c:8e3f:3036 with SMTP id
 af79cd13be357-947afcd62cfmr312909185a.4.1794393066423; 
 Wed, 11 Nov 2026 02:31:06 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:93c:8e3f:3036 with SMTP id
 af79cd13be357-947afcd62cfmr312903785a.4.1794393065792; 
 Wed, 11 Nov 2026 02:31:05 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e61c333sm449898485a.3.2026.11.11.02.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 02:31:04 -0800 (PST)
Message-ID: <bd789f92-c5ab-486c-9235-74d09497b020@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 07:31:00 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-11.2] hw/riscv/server_platform_ref: Fix mtimer
 frequency
To: Sunil V L <sunilvl@oss.qualcomm.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>
References: <20261111101609.1183263-1-sunilvl@oss.qualcomm.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111101609.1183263-1-sunilvl@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MSBTYWx0ZWRfX2owMlmGP4lGG
 +kQ1v6TKkUQ82JNCENWpku57DszM/tywkgJVZHeVQN8KUYy/+WpL0qIBuJO3ZmwiJTurBfoudmc
 l3Wxp011/l6HIrHQ9Zm2OhQQFmlp4NZtrlyILATf5JVRVeo/Qi52jUHjsgmteNuAkQuOImpZaat
 n7GzyfVpeq2oIifQex74U5mJPVhDnNSHoCurSQ6lH801Fo7J4Dii7xnYq5wgJ4Lde1XVaLk5esy
 90wsxsSPdxwDlk6rG/wQFB+sbL15TXOVVrHpvlV8iJR672QICEntThmJ4Ab7kbkkLftrZCfaVoJ
 Kq2Ql7NgsNWFfT+/d7bs0xQvaezfrYn+elbjTDiqall2/wXziF1U0Ko3uQ3BPHACUJCaYQLi96J
 MKRrDxH6H6lhQhNYMD//7bBK0KG3Qx9wAjfE80SyyCxoXcIdYCnARJSa4wSBYnkY43H14JTmcTm
 b3HQ0B5ceZ3cjvenCJA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MSBTYWx0ZWRfX/SlKOlC/gXIm
 DwWTUbTF3c2Eu+OK0dgAyT3ILdbSeIAWPleu4mEl/QyyUnaQvnEAP+TAqh8rokm1OFA8Zr0w4Zs
 PcVHroZLKq3/ZpdITabQ/lfX0/rcgi4=
X-Proofpoint-ORIG-GUID: jz48Rmw8us134iImr5e8kGhf8Ne20xpi
X-Authority-Analysis: v=2.4 cv=eq9KXYpX c=1 sm=1 tr=0 ts=6af443eb cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=TjprVoOyLZnDu5hoBU4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jz48Rmw8us134iImr5e8kGhf8Ne20xpi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110041
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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



On 11/11/2026 7:16 AM, Sunil V L wrote:
> The RISC-V server reference platform requires a 1 GHz timer frequency.
> Although the timer frequency is advertised as 1 GHz in the device tree,
> the mtimer device is still created with a 10 MHz frequency. This mismatch
> causes the OS to boot very slowly.
> 
> Use the correct 1 GHz frequency when creating the mtimer device.
> 
> Fixes: c2fa4320803b ("hw/riscv: server platform reference machine")
> Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>


I believe this is suitable for a freeze PR.  Thanks,

Daniel

>   hw/riscv/server_platform_ref.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/riscv/server_platform_ref.c b/hw/riscv/server_platform_ref.c
> index 5f485b1c79cb..fec967f708c2 100644
> --- a/hw/riscv/server_platform_ref.c
> +++ b/hw/riscv/server_platform_ref.c
> @@ -556,7 +556,7 @@ static void rvserver_ref_machine_init(MachineState *machine)
>                   base_hartid, hart_count,
>                   RISCV_ACLINT_DEFAULT_MTIMECMP,
>                   RISCV_ACLINT_DEFAULT_MTIME,
> -                RISCV_ACLINT_DEFAULT_TIMEBASE_FREQ, true);
> +                RVSERVER_ACLINT_TIMEBASE_FREQ, true);
>   
>           /* Per-socket interrupt controller */
>           s->irqchip[i] = riscv_create_aia(system_memory, true, s->aia_guests,


