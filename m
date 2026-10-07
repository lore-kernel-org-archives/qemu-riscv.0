Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E38DFCA6007
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:21:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOlO-0008Dn-U3; Wed, 07 Oct 2026 06:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOkY-0007oa-8H
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:19:53 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOkW-0005g9-5D
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:19:50 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jlFR152090
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gOMsU4qVMOJXitVPgP5knCEUXcopCFq0+HUUlmQbBdk=; b=UExVD8hHWhsdNPvl
 ucF56qbjCkXlzVSE3NmR/F/baUvkhL4+1FMnvBO1fSEMDedp5NOf5xmSX3z5/1a8
 07SJ9MLOwrNd6ic8wn9HeBll/abyEU7wFzVUPStlZGlPpUmjRrmVJmFcpmRRtAqL
 /ejGfIEbjF9PxHF2wXOTKRXEWSPhCEGwJjf3Unr3sjjsE6L0KxKNwU7HTFauZSBG
 C3pef+ZVWP/wNSBKU05YoY1GwCuapSZ0RFrJMBYp2I7FMrvepscqgKBz1rArgXK5
 wcSaKuZuzpoLeBluYlnd+bTeNL2v8JpeVi1noAbn6p6uB4PDfSpdYYL46iUN4Dsy
 ORUpHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719me7-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:19:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93cc7a6e4e1so1058212385a.1
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791368385; x=1791973185; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=gOMsU4qVMOJXitVPgP5knCEUXcopCFq0+HUUlmQbBdk=;
 b=TSkMOEkG4+QVQXJOBehserWG8juYnb5QOqPAvSURJwn4nZ2/q4YHpgnysCMeMyBKgp
 Gra8+jO5GDoTmBUa9mDwHubOAPCWPEKIAfjqPOCaE9HNeBWvYeLLI7AvilujgYeImywI
 0WjkV5NxNMJ0e8+n9JN7xg0O560FmGlEUtJ9X873mtRt7Kk8qkHnUxJzmo1vQn8TCDw7
 c3l4Mlbe9Vy8PdGl1mCK5RW/Bpicq9lYJPqnXzf+SyApsn9e/lLnrt9mhA3n/VpyMwBM
 QdlPxdqCpAP1nPfZk8sHP5OiWIK7clRxGK3LK4xkugJqULfk1vko3b0rzSKxScJvix+G
 l/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791368385; x=1791973185;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=gOMsU4qVMOJXitVPgP5knCEUXcopCFq0+HUUlmQbBdk=;
 b=YJOUaf7ujUz0ofRLDmxGDjAYx0kZd5w7iWcDGltwx68VhIb8lLLA9xgSSwNy/Wil7m
 xeB3SaMjw4FkCGB1iPneZ7TXikgX64iCCb4sWVs4PUXjDox1Jd1MgJSyNkz3pzohM+TA
 se6lhkvRw7NdW1F4e/eRkWRawOg9aC+4B8MFzyObkwExbY9W9/1FQo89hqXGjAYngJLp
 GmBGRtj7B9d8v0SRfnQkIO1KPUokmBe8yUAzqHGwFM0JEKQpSi8G4FUrpqL+8erfQUDT
 NrNqi9Mhp+3MSl1qpuPRm2Pb8pV2XFE6lX9zhsafLDeyWlhxNJqFkki8IlRkwKo8SSBs
 Z50A==
X-Gm-Message-State: AFuF++l6644WmG0TTcsetZsyxEtaLPyUk6Nkg31vpk/p7o9/XHAXQgoR
 6rciDBha4oHnXvQwElUd/DjCNdvMyVcALD2hbe3iDsd9gNAfFm7B9uhDBSFfAVG9D9o6QRY1m9J
 K2uR1/QNR0spSIGKL8gF6UuR/GW1CesVC3m1tcev3kwBFC2VF1rF1jFPTkg==
X-Gm-Gg: AYBFou2tikSEsgWmgfw8doomlgplVJTd6eLmJd1uDfLLs2X6wAjOin4M8piRH3ZDJ3A
 AidPOYlMPMZjqmwXle/JCdP/vBJQ8JekUgopTMY9pb/uNkkm/x9xcojgTgbV5jjrTLMNlRIjW3L
 H0CclcYNtKzMlMj8CIxUfC+NWYBSNW42mehBjh9aJI8JRTJnlBWpuTuT72AEho7wbnuFwPaMJAJ
 i2m9y44GqkL9Q7rnjUuDhYjO+OXSrp5gzF0HCTIs+l475TtckJupF0PDDw4KQZg3RjtKoUrnAxT
 anXQxxPJPFOfxwuWyPJodguIOagaIK6hhzIruuKpG0LItuU0qWONpNpJ5KiLVeD39jpU2GLHUbA
 iB34wJR7FAzHlhHPVEflLphPsVOh59O3pag==
X-Received: by 2002:a05:620a:4113:b0:93c:7955:afd9 with SMTP id
 af79cd13be357-93e9b7f5871mr295023085a.52.1791368384846; 
 Wed, 07 Oct 2026 03:19:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4113:b0:93c:7955:afd9 with SMTP id
 af79cd13be357-93e9b7f5871mr295020085a.52.1791368384343; 
 Wed, 07 Oct 2026 03:19:44 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1787e7792sm133524535e9.0.2026.10.07.03.19.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:19:43 -0700 (PDT)
Message-ID: <596c47de-255a-4436-8e88-bc44b6dca0c5@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:19:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/18] target/riscv: Runtime register MAX and BARE CPUs
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-7-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-7-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6TRGECsWlpD8
 Sy2PuhTDjHx6FkVb7hCAwXzPQszFx5PesvWC5zEUGP6qiOKt5ApGdHNZH9vhK3yPo2IV6faEyKX
 PCm+j7pNgYUx7yDjXzljgp0oUT4g6pM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX70BWHYJr+Xvo
 MgflrBrwWuGt++MdPwUqYnzAjhZ1PxlFFW6TmPXWwfVfIF6AjvNCw2bSGBWWxJju1rocgAY/NF3
 CuwPgloEdxPxUri5U+DQW3Ydl7PQC2IrIaen4V9uUVlAdwclFMe2cotYi2yCENLTmo2pRHw+5cv
 pF87zGyEsVcFmtLz2i+pJoGTRHov73VaLU9Ct0YBEqSZ6iX89Yx1053O0g6fUk0GQhJGxtFy0sD
 qbms1gNmWGZxyZd8/enx1GA4qnleolsuRDAE69z32ll/r3tpu3ETThYGaG+t3BrIilnBIFT06yw
 LoJMwPrPXIx8+eJCBvPusliKlHaE/sq60ULzGxLCDM/pzL3zo7A1vpuXN7GUnxxzb+OD4PnD3sh
 Er/AaOSZrGD3fTQmzNFfZfvymuQQ0oVsTfZkwVEJDpJ0OpGjujyUyqf8JXG2GQ5GwvG1BJYybwB
 DA/6pKGBQQIAzweD/yg==
X-Proofpoint-GUID: H2mipmwM5x63DcjJ8L3qvrQuG-z0YtXt
X-Proofpoint-ORIG-GUID: H2mipmwM5x63DcjJ8L3qvrQuG-z0YtXt
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac61cc2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070041
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

On 7/10/26 10:43, Anton Johansson wrote:
> Moves MAX and BARE cpus to separate typeinfo tables indexed by
> target_riscv64() during registration, similar to how ARM handles MAX cpu
> types.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/cpu.c | 86 ++++++++++++++++++++++++++++++++----------------------
>   1 file changed, 51 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

