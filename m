Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9E5606A881
	for <qemu-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 10:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a80ElUYe;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H5gBEThv
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xR5hY-0006CC-EA; Wed, 11 Nov 2026 05:37:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR5hW-0006BZ-Ff
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 05:37:10 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xR5hU-0005m4-2w
 for qemu-riscv@nongnu.org; Wed, 11 Nov 2026 05:37:09 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6AB5KDvI1409011
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 10:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 iUp5/IEs6JgM7LSa+9KuH3IQBNTZyfeqKEgEODpR6JY=; b=a80ElUYe2DLqa7l1
 JAAc/UyzFTYFlJjvPtpMqkKelkeW4IUrVB6f3YSp3th/rbnNrvpL38veOg6P6hAJ
 gNljg1uPclZMX4SDdJUMf1Yagx9PgMLEVcL9EqCzPiUP6cvunmB5nlW4XqN8HWEq
 6V+LJM9ImP264yn300bZ3lJ0fnVRNCaCPMQ/UuBg1JlvlZXIs5IrFaa8ituOXxVg
 yHZorOmul+JMKbJEck9JbVzU082p+j2CR8vM4K95iVj7bCowdSgvTsEKPuY3QIy2
 B8gUEHRcFKoWJP0cAy9avQIhr/o2ExLSRDHSJXjb8ZaqHOsn/GjYW7rbsmfaGKvU
 5rCSDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhev1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 10:37:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93caf6c528aso549243185a.0
 for <qemu-riscv@nongnu.org>; Wed, 11 Nov 2026 02:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1794393425; x=1794998225; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=iUp5/IEs6JgM7LSa+9KuH3IQBNTZyfeqKEgEODpR6JY=;
 b=H5gBEThvRtF8gnntgOgnsVCy11QCRArDfy01lGm1kb3PCyFCMf7JjZzN/3tVflX2lj
 Dp4GWDfyzA01W/tg0WfPrESjyfTaR/M76ZBWGfjOhsp6uAThFnJ5wordAZFo41uq0pUc
 HzCfLA7nAyXsE5ag0227oELD6TEh4wRjD5K0B3+ePELBoy2pPlBPPzA6Q7Pybk2nUHhs
 qM83r80w4wQ2sro0u5biTBsD8DHw62Xj8HL6Fq6WAUxhqRRbllSGc0P6WYnxAn9KMznx
 kvte3nK7x/imP/M1JZX504RD2kd6zjcLSO+xhvnrf6Bq+c1sHnd0Umz91iGEKvytbvwN
 p8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794393425; x=1794998225;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=iUp5/IEs6JgM7LSa+9KuH3IQBNTZyfeqKEgEODpR6JY=;
 b=JyDzXFue4yadcm+qFD1flo7IOKVNqZ58kyRZ0wjGkuDTekTNUkrKXURczBZcfnVSbZ
 CLdAMGlAhH+FTDUdhDXGpfdicfpsy1U3FjYwqUrDMmlN7cbEmmyv/xdrq58r511ccxbe
 L8rSgrByTp8L9b05keXkqxuo1Xw2JJhVm7s/wQ9LFkFbQhFWPAUGovkdxERi9ImJyfPG
 2h3hS3yGzLF8w6TPBZxGE4M9E5bgcuK7+uFV+BzqlGwAR4h2eV6t2JaxB/xst7HAg9xb
 Ke/CbPULXwxte9H7Eyu8DgujxsbrY2FaxlT/enWEhNRavhPWM6g68y+WyzPEZGvbVCuO
 4AhA==
X-Forwarded-Encrypted: i=1;
 AL+hErHphX+lApDnmNPcyxU2KRG0tizgCeF76CRaBGanH8h/3MlDb/JpQjfPq7K+6dtizI4lndOu58oFeT+2@nongnu.org
X-Gm-Message-State: APuU4Z+GZzAI2sgX34cTQUK0foelrlWnk6o6cRnuDRA2ZME60q5dNTnb
 U45xYmRmStbV1HFcvugGLJFE5E0bHrMxb7AwYLIFQPIZ3l51C0mc/O/gmSWAQBUlAMYSwxrmJ8R
 9PBji61JpEc+T257BYgKTH25OIoIW95A9QLUJrtrLmboXpR0wC+Hi7RwXqg==
X-Gm-Gg: AYBFou1mLD8PNq+GCyhaNPGOdUyVIHA7OV+VgO2oD/zcBNXFx1y//wdt062JVDSu0+T
 hO2tkfZJwDReKLWOeQVJE+0RLxykYKZIAlWcvyvC/sIbwCXqsVKw37RkH+4VYy2hl7HRIAGrFEo
 /9HNdpMQGgZkFgW9JPmKDaaCPE3XRmqk3oSWgxTnf9tXaCb5sT04tEY/JbwTQZXRFqXqfND6TGP
 pc4vIn0HZxXDvIp0q8WaR8+mvZGejKZvxDvhXjEEkYrauWCM6prRUGAeEJcdHvfdZLE5bg0dF/3
 KVpsyTDLRDb7zEbLQ/FFVcd38/g5aHpEkWANemiNGBwzruPAP81igHoirOTImUZUDHP/w903LrI
 4ocGyvmHJEPkbubVEYATSvHbDSTQ7DLuNtbpNxhAoIQCYeP88KXQN5LJSH50OpmK0/ccGFlmkk3
 KUPKhqLSd8eg==
X-Received: by 2002:a05:620a:198c:b0:947:8f04:1c1b with SMTP id
 af79cd13be357-947afb8cb4amr316997685a.3.1794393424909; 
 Wed, 11 Nov 2026 02:37:04 -0800 (PST)
X-Received: by 2002:a05:620a:198c:b0:947:8f04:1c1b with SMTP id
 af79cd13be357-947afb8cb4amr316995485a.3.1794393424447; 
 Wed, 11 Nov 2026 02:37:04 -0800 (PST)
Received: from [192.168.68.105] ([152.234.124.231])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9479e4fa312sm453134785a.0.2026.11.11.02.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Nov 2026 02:37:03 -0800 (PST)
Message-ID: <9dc9aa28-9c7f-4675-a67e-0a7569e4c176@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 07:37:00 -0300
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/riscv/kvm: Limit SBI DBCN transfers to 4 KiB
To: Zephyr Li <fritchleybohrer@gmail.com>, qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-riscv@nongnu.org
References: <20261111015724.47594-1-fritchleybohrer@gmail.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111015724.47594-1-fritchleybohrer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af44551 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=8elE1k/PHQNyZ14TNTodlQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=p0WdMEafAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=Zya2yLTonIcibLQ-MgIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: mB13hhZoPv58yEUd62LuZgkUlCOw837p
X-Proofpoint-GUID: mB13hhZoPv58yEUd62LuZgkUlCOw837p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX5Zh+Qu16b2i9
 DoLgqcstaa58Fq8ZdRgpcfqLxK39IBfP1aGQP0Pu3vPIqKvEqwrmAkAM7HjWTQS09qymD/Vavi0
 FGmH1H9Db2MDpjsBVYoyp1UEFTBSvo+V1WVT+ZtftHpGrLS7sDAjKJMzhTWEpTYVZ9J7YNiy3oK
 1ZkFuXNS2U+U6fUdpTY5ZOZWxQyB9wvZsY/2gx1l0Hn+J6AbDK0dDuzOtPMxtPGC86DaF9a0Ybv
 fFjMsdyjZQKEER3O0c0htUIJLlPks+eVeVyt/EN4CInveVItYjtkbcBLNrV5hUJ3C6NIXuBIU8u
 7VppMPkWiD70n+XiskoWhhlJgsARjaOaHQErwSu1QaWSFEPaXdYMOFoLjTXIRP7UIAck9KdoFvj
 YAVx5lYV6haIWMhxWSWjlO6hELdlpX9odsIce2cU550kanwPMEa014phP8ip6O3Hralg5TqIM3m
 H7bR69XiYfwcV2WRXwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0MiBTYWx0ZWRfX4cfacGMkpLQy
 pNLI9xqaEPc9zxuYnLW5SZYyd0X5WJt//0DdEVQNiDOro9g2bNpBckY4F6YudB9IleUIPMswOfi
 OZGFmdn8Bagrt+cArDyLPDcBjRUofhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110042
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=daniel.barboza@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/10/2026 10:57 PM, Zephyr Li wrote:
> DBCN console read and write use a guest-provided byte count directly as
> the size of a g_malloc0() allocation. An oversized request can therefore
> make QEMU allocate excessive host memory or terminate on allocation
> failure.
> 
> Cap each bulk transfer at 4 KiB before allocating the buffer or calling
> the character backend. DBCN permits partial transfers, so the existing
> return path reports the actual progress and the caller can retry the
> remainder. Zero-length requests and WRITE_BYTE are unchanged.
> 
> Choose 4 KiB as a bounded transfer size consistent with QEMU's memory
> allocation guidelines for small allocations. Linux's DBCN read and
> write helpers already limit each SBI request to the remainder of the
> current page. For guests using 4 KiB base pages, this cap accommodates
> the largest request issued by these helpers without additional
> size-based truncation, while keeping the backend length within its
> int range.
> 
> The 4 KiB cap is a QEMU implementation limit, not an SBI-defined
> request-size restriction or a dependency on the host or guest page size.
> 
> Fixes: a6b53378f537 ("target/riscv/kvm: implement SBI debug console (DBCN) calls")
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4431
> Signed-off-by: Zephyr Li <fritchleybohrer@gmail.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 5beb602338..a301b584da 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1699,7 +1699,11 @@ static void kvm_riscv_handle_sbi_dbcn(CPUState *cs, struct kvm_run *run)
>       switch (run->riscv_sbi.function_id) {
>       case SBI_EXT_DBCN_CONSOLE_READ:
>       case SBI_EXT_DBCN_CONSOLE_WRITE:
> -        num_bytes = run->riscv_sbi.args[0];
> +        /*
> +         * DBCN allows partial transfers. Limit each call to 4 KiB so the
> +         * guest cannot request an unbounded host allocation.
> +         */
> +        num_bytes = MIN(run->riscv_sbi.args[0], 4096);
>   
>           if (num_bytes == 0) {
>               run->riscv_sbi.ret[0] = SBI_SUCCESS;


