Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E586EC79F99
	for <qemu-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 17:16:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3cxG-00067c-UB; Mon, 07 Sep 2026 13:16:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3cxF-00067K-RD
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:16:25 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x3cxD-0000YJ-Si
 for qemu-riscv@nongnu.org; Mon, 07 Sep 2026 13:16:25 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 687H7oen498379
 for <qemu-riscv@nongnu.org>; Mon, 7 Sep 2026 17:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NudaZuh20pb9OrAE+uuSrvY4N3y9eQBHbdbRyl/dtzk=; b=hhSw3S8Dq9s4ZJkz
 0gzwj6yVa2lFACsfj3X5bsF1E3a77IxZgVUrCq6TlY1fDXPTa8apUfphk6dyQS7h
 vPrV8lYqi7gHHCzkTpfjU30wkySSjzLveDmdOGj20YsGuQZAwwQQAuz+9SMstIEn
 9DTWmaY5wD5xbtF+JcWXu457ezUuikfwMlELJ3MsFW4ap9Vin2EEGkDuTf6VqAHb
 Rr8tbYhFwM+WgnxArZUtnOFLxB2M0uqA0vPVq3jE6kGMimXo980dlHrBa6QmuvDP
 1mAPSyr2NqgEpTmrAdN7Zo/azZ3Bgou2Y5xJUkFL0EefBgjn2DoaXN/vfPamjbCF
 3Mek3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66jspw-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 17:16:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-930b571432fso572064785a.0
 for <qemu-riscv@nongnu.org>; Mon, 07 Sep 2026 10:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788801382; x=1789406182; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NudaZuh20pb9OrAE+uuSrvY4N3y9eQBHbdbRyl/dtzk=;
 b=VLyUQ3gybJenETshnqqqRkPD5tg/jOfLuhDxUrCIdL3DwgU9dMjTzHP9PLZGWP61W6
 3I0/6yU3jtPdafo4RcNqsL2bYWwz5xrPCnAjKH/qxRtluL4A1XjP0OzyxYBVQl94N4iB
 W/Aq8ACS1NGeg6RDosak0RHJzc3dfcSb1tjLNeMnsXb+yejg4ejXxoCi58dBXiObqbaq
 wycCeb5syHDtbEc9VONxc3VwQAWm1J6ahPF2gRW+ZZqTw2aP+6Fyjhm/0dHjXM6sI/OU
 cSSGwFJChx4gNhMjUChXYRN4jkAfcvC8cqpxB2T/keisjo1A+5Tu7fhLMB5P9VEMHm8P
 7owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788801382; x=1789406182;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NudaZuh20pb9OrAE+uuSrvY4N3y9eQBHbdbRyl/dtzk=;
 b=q7E5raMXLH8edA2prCEoKw1SbtZuHMSyvF35D8z4KjVTgnGUd8jLk+4XsUhhmmoOTO
 RNxrJaHiBcbdiTJ0z2RrUn0HaDb4OtgZ7Nzv6mOyLGd5lOegJhBTobAZ1EqixlN9tb3u
 /AG67dQrf2aOvuKRR1IMxnGQK1WASjm9/5WQW97io5htwnO/t30vYHZFw3LRQMvDUeys
 kKIyt4zIcvfiRD+lNA+kHx+hr3J8PkWhGA0yWGSlwSlKYker2d+dlnKzuNno50on6onC
 VY+jWMgXOKqiZxTBkZEJGXN64r9llU+pqiUe2l4r4y3148NO5vVIZ2+fZ08P44HqLI6P
 Qbyg==
X-Forwarded-Encrypted: i=1;
 AKwUvByfHG+oSawCQNaak6pRRXURQtjvQXlYbJBziyCgU+ryCDafeHtGm9M/a6mNMfLlksTyA6hvUabK8Stx@nongnu.org
X-Gm-Message-State: AFuF++kkfuivgwD76xv6nkrH/UGLusMfSlUCdWJfW8pdTkYaIXwqE7UV
 PkAjR26RuXnmfx41hKkI+F5PbPorj8iyzP9hw8ZT2BBVIWPsn+Z6uteEe3aDc/V3zccGXazFYey
 w3vtkN8qdgqhU42QsOBKCLZOxg4dXwMqOrkicz69G99AFcoULix9i3c+o/g==
X-Gm-Gg: AYBFou0piM5MPeyKOManRaeFjmWtIDWAwqDThHOiZnTchLzt+LrcM9lhegs5HfRyapi
 3wIf21UebynbingqxXNSPAGlTV1QNcEkHa5dEYIJMVi40ttBZEHiqFQCZkfpEx1EB+YBVq0IBjS
 1cW16RVr8JNwJKYs2gzoDk75N7ysEBmA2siUTl2F/ZUwKcp//fDisbWxs2qAVx9Txmss6/mtlqo
 BMDnCGTUlKfzsAve+/twFY5s7t9ZeZQNSuVhm6ivR1D2z4UPCEgIcWWgljoeuyn3ZGhzcL5Oqfs
 zxNRsS+7EOHWrmXfRoUoW9UAM6ObRLm/WxlLsROphMjYjdyRBNinv5u0CVyErpBE813X1hZPmFh
 urOSnCkTZjn23ETnZNcr64GPyB3UDMRbTcO0=
X-Received: by 2002:a05:620a:4628:b0:936:9253:897a with SMTP id
 af79cd13be357-939b793fde9mr226376785a.9.1788801381811; 
 Mon, 07 Sep 2026 10:16:21 -0700 (PDT)
X-Received: by 2002:a05:620a:4628:b0:936:9253:897a with SMTP id
 af79cd13be357-939b793fde9mr226371485a.9.1788801381351; 
 Mon, 07 Sep 2026 10:16:21 -0700 (PDT)
Received: from [192.168.68.102] ([177.18.66.131])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9397fbe31c6sm936674185a.46.2026.09.07.10.16.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2026 10:16:20 -0700 (PDT)
Message-ID: <afc42595-0e64-4e4f-abf2-2c2789615b93@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:16:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] target/riscv: enforce XTheadCmo U-mode privilege
 checks
To: wangyang <wangyang25@otcaix.iscas.ac.cn>, qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu@processmission.com>, qemu-riscv@nongnu.org
References: <20260905093749.491-1-wangyang25@otcaix.iscas.ac.cn>
 <20260905093749.491-2-wangyang25@otcaix.iscas.ac.cn>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260905093749.491-2-wangyang25@otcaix.iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9ef166 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CQQxcbsX5Byh3TlVSSGwig==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=EUspDBNiAAAA:8 a=s9-6PEyvpDKoicTLdYwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: b8Xd7GUf4PTZJw0Pej-zBL9v0ofNIV-1
X-Proofpoint-ORIG-GUID: b8Xd7GUf4PTZJw0Pej-zBL9v0ofNIV-1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE5MCBTYWx0ZWRfX9HnHC06fM77k
 aVGwJ4y6kRuavs51rHtrSGJpJ2AOkH2hv3brji4pWipgFqFNGNJQjiWHkqUzvxUlRdnE21ukNzQ
 9JO7MRTK/+tGjy4ae4oM0QBBm531800=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE5MCBTYWx0ZWRfX2h4BEwJf2GIl
 stZ6C4+S4BXgxWg3xkCDRFY6qDcLbB7ApF4IMBHVHXrNDoXY3dd4NBwl22JSf4dPgFGylADyIEl
 wUohvpqX/SaTJHVEMGUQsSoEboYCL15t1BbCbazhSnYNoQKrXI/N2bhUkX1YFveyVmFHGdtyeHm
 Vc4qxqZAxNQcPPg8E9QmiN0cIN7CzDeQ9F3DdyKjXX+jLwJhgkuD2HzwXD0EwshQeAeD7xvFAhd
 5A3IO4b9CbeRYcctAOH8+KC4+Bi6bYGe8cvPu0r5mFbu7ep3+p7gLw1N0r+I6YM/dGvj0Ajo11A
 yulPJpwwGaqzIRT1XOUMrWKy+WSyZJbyCknqYVsnxCr59bBiCsEhElUScZrzZFpG40FCaU1HHAv
 V/MUTvact8ff4aLKZuWmEF9xKsxy9RFZsoZ4oTi6dioOv7YhfGbwvLXVE1vcs8Q22bEXRzLJyw0
 D6ZDUMG93RIQMOgyVqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_05,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070190
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org



On 9/5/2026 6:37 AM, wangyang wrote:
> The XTheadCmo specification restricts th.dcache.cva and th.dcache.iva
> to privilege modes above U, while th.dcache.civa remains available in
> U-mode. Both restricted instructions currently use the empty
> REQUIRE_PRIV_MSU macro, so they retire in U-mode. Use REQUIRE_PRIV_MS
> for the two restricted instructions.
> 
> Tested: RV32/RV64 Linux-user witness matrix with xtheadcmo enabled
> and disabled.
> Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4412
> 
> Signed-off-by: wangyang <wangyang25@otcaix.iscas.ac.cn>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/tcg/insn_trans/trans_xthead.c.inc | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/riscv/tcg/insn_trans/trans_xthead.c.inc b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> index f4e3051000..681f70e5bc 100644
> --- a/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> +++ b/target/riscv/tcg/insn_trans/trans_xthead.c.inc
> @@ -289,9 +289,9 @@ NOP_PRIVCHECK(th_dcache_iall, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_cpa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_cipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_ipa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
> -NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +NOP_PRIVCHECK(th_dcache_cva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_civa, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> -NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MSU)
> +NOP_PRIVCHECK(th_dcache_iva, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_csw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_cisw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)
>   NOP_PRIVCHECK(th_dcache_isw, REQUIRE_XTHEADCMO, REQUIRE_PRIV_MS)


