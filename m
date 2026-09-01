Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F125BC61DD3
	for <qemu-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 20:13:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x1Uqb-00080x-RY; Tue, 01 Sep 2026 16:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1Uqa-00080J-Kh
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:12:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1x1UqZ-0000l1-34
 for qemu-riscv@nongnu.org; Tue, 01 Sep 2026 16:12:44 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 681HgrYu2748306
 for <qemu-riscv@nongnu.org>; Tue, 1 Sep 2026 20:12:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZL8Ji64kRnxHQZQLPiQcUUROn50LboarMw4PDxjQs9Y=; b=gDSyOhtMZQ2tjFrl
 HNaCkWnFsj0tc9n6H0MyISGAufrIqVk0+C5hgJDNe7cmUxP1fDLwRcVoVGCZfUGZ
 GLnlHO4omPkDaguZBRQtpN0qKI8K3L8lYD8LYP/exnSWxtkmgLSTOKD3wBkrWODV
 GN55bIhVRQv+0gsAWDWMFUj/EGeIrahb6O5EMUzCW+RcQrOR4ibDqIJVZkj/AxXg
 aLcUu6KXyyR8wHk18JWcM1OB4fFyXQY1E7BDiMu9FbQOw7VfvC+bgHZSMrSXG7Kf
 n1b8GiGhBTPjKyt/hn5DsX2u4ai9xzPUYOJq2hnx0+odC3u9POVDvJX09NNbc4nJ
 s0re6g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wp95n2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 20:12:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-9308eafb465so83612785a.2
 for <qemu-riscv@nongnu.org>; Tue, 01 Sep 2026 13:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788293561; x=1788898361; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ZL8Ji64kRnxHQZQLPiQcUUROn50LboarMw4PDxjQs9Y=;
 b=Sae8AEq8n20rORl8a28MYSIobvrnNyt3aefpE93sfiVwmUgsxdC8h5lSNnneg2hPxT
 ZIC3rQvgUvehPSO86fWeiAmh7IrTg+vX37C06nVFihHum/k9xlEiy7+IlJOdcvSlZrlE
 RF2QkfUHNfCTq0Nq1LA3sgL4JCDOdd3dnMfo/hAzUYqoPWNAnE6OrvOAA5TZf5r9qO+T
 p5PiPvCU0l7Oru1FTo3hHVc/wVt7giL+7KfheOpXJ6+yefmrLNdCsvpXAtlmHgDXcM2k
 mgC99ORS2O6FMeyxz+hqt33RXtnx66+0RSMTzcAbTsS1tXqFNY04+WxGUEUj3NSFsMfa
 VfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788293561; x=1788898361;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ZL8Ji64kRnxHQZQLPiQcUUROn50LboarMw4PDxjQs9Y=;
 b=L6hWPYy++jmkrEuy6p7X3cmHqvROi29jgfbVYxGHVjKFRn4HKShTIAjzX9YaVHu0gR
 mv+CZS5vXRuJCYoYxkmm6HGyUHiOz6/LRkDJsUsqMKxHKNJ+aWLFj4jU56R1/FbwdvVC
 vecwoqg1pEDyJHi4vptvUWdC1/XSIFmLR4e4v3OU5kFbDyeulkw19/DIFroebXByDZVs
 fdF/+95yRRjzLMVhm3PV8KfmuR5Dlfc78FZQQ68Gyk6T90iRIvi8zkDXBVd03VoZFv6U
 uncgnQVhQRLJ2FyPUnsXU+CdfdUjb7ND1CklJ1lvU/zR6cLPtpSO5mvgxZ78H/urjfgB
 swOg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq530JzdIBLSj97lsP5emeYRSpZ6Gi6HhtKQXqj7vsyabcIkQh1KPvLDJszIxfiDBSYtkd/FRYy8EWV@nongnu.org
X-Gm-Message-State: AFuF++lrtgKSoemKckjktfS1gQ4a81AyJ5pLENfMDvuTtsqzblkSPOh3
 8ZFiYkppdVWdNyY0Eh/H0ithokk4qDJL0rK+kBKGdjlV7fkI7+s9anT7MqKV0VIDktj0b6rkEZ/
 ITaDpn3jfHdEZ3sJvKKL8UE0dhNrrEeZUrKQ7P1GGZYj56m7Lz2Tic/ZkQA==
X-Gm-Gg: AR+sD103nLMDa/vPYDX63FkRYbZ2WX6PdXqkToF7NRkkI/3l/RJZ4aIoOofw84MKerK
 kKbbWbHaEpUZW8P5vgm+RKwvp+uEX/JwmvuQwPEiZjE1L/sRqr82Vo2+CGeQDAaO2qyOq+PLZmT
 bxtfacoZ3QQprbr3euv/0uSXusBrNVZ8OK5zAl3dX7icqI2KAKAKM1T8Ew62Q69eQ3S5LgPdDAA
 NxxNOg7AGjQrVQ4f+9pkYojzdSWpKR2qvDDADyj7Rho98L2iyP5PbIVtmTkyEZCpIYykiY1B6R3
 LEZfWThLWkmObZ2hw7KB3DkflUS09k/TNsv9SwcYDycUpw+HgsdO5m1iAGZ3yfplK/4Jp3tHtKS
 o/7EWz0CDgCLLTeUe05G/LMa66H4hkms0mSdT
X-Received: by 2002:a05:620a:294a:b0:92c:103d:63dd with SMTP id
 af79cd13be357-9395ec72930mr138667085a.39.1788293560652; 
 Tue, 01 Sep 2026 13:12:40 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:92c:103d:63dd with SMTP id
 af79cd13be357-9395ec72930mr138661885a.39.1788293560226; 
 Tue, 01 Sep 2026 13:12:40 -0700 (PDT)
Received: from [192.168.68.101] ([152.250.131.13])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90e9f0f8adesm1363346d6.42.2026.09.01.13.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Sep 2026 13:12:39 -0700 (PDT)
Message-ID: <cfcd834c-5d33-4ca6-8d77-737d03437c20@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:12:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] target/riscv/kvm: Preserve VCSR across migration
To: Xie Bo <xb@ultrarisc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, liwei1518@gmail.com,
 zhiwei_liu@linux.alibaba.com, chao.liu@processmission.com,
 qemu-stable@nongnu.org
References: <20260831074106.1798671-1-xb@ultrarisc.com>
 <20260831074106.1798671-4-xb@ultrarisc.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260831074106.1798671-4-xb@ultrarisc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a9731b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=CXdxNCAnTuDr1kYd6DjE4g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=69wJf7TsAAAA:8 a=Lx1EvxgrAAAA:8 a=EUspDBNiAAAA:8 a=_yrhSRU8EesBMVaPoN0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Fg1AiH1G6rFz08G2ETeA:22
 a=ZFi1QaP_tuf8dODdgmj-:22
X-Proofpoint-GUID: TAcfhWOl_hLvHeFf6Z-gvivSFre7UD39
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE3NyBTYWx0ZWRfXwY8/owuNmJdG
 vq1GGZ/ojl1idzDHw9G8Ioz6fH+YUg++b1bueSLPVO1PHZsCsNJnQiLE4Fj7LdizQCTs8Pcut3L
 sjXYFTx+xNmf03WL0hw4g1ZX+b8wGF0=
X-Proofpoint-ORIG-GUID: TAcfhWOl_hLvHeFf6Z-gvivSFre7UD39
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE3NyBTYWx0ZWRfXwNkGU0/GZJHa
 aoZYJ2FiXj/5yH7GsmjAdEXzGbXCNDtZVHntIbJJTjkDb54Of8YODjPOjojcnJjZc8zDdTsKON3
 bllfnoFBxTDlY2/cqQQ4Ln58SiTElWLz+KMp+P6X1cR8qwculZ0zeTgyy2+uj+IwVQYQS6nfYmG
 0Iyb4J8RKxnin7aMxLoObbROeE8CIMPrABjEPCdztrDdpNHV7llw/FvppoFLZHWwNup8sMSiGos
 PmVSa8PHuImHFs5U6gdxHQl3cN9+tUN9YS1/qmPh8ydYHzjaNM6nSQ1rAC91Ny1c+28NPGhY5xv
 VWuP1Mp/uew7fkOIS3CfGciD06nY6GM2YoomLaZ5G3jic7BfrIXFCD50r1jSS3/PyVMoDrOnXu5
 E1qN89QbzfPu/8ja1+cNsORu89nGyooTI0KxPaESshFVp+m2ucd5L/2M5YFCPhXG4HJD/wgWTLb
 j+YP4rZhGgJ+fhBYOpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_05,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010177
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



On 8/31/2026 4:41 AM, Xie Bo wrote:
> The vector state sync handles vstart, vl and vtype, but leaves vcsr
> behind.  vxrm and vxsat in the migration stream are therefore stale,
> and the destination does not restore the values held by KVM.
> 
> Read vcsr when collecting vector state and split it into vxrm and
> vxsat.  Rebuild it from those fields when writing vector state back.
> 
> Fixes: 3ca78c0689d5 ("target/riscv/kvm: add RVV and Vector CSR regs")
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Xie Bo <xb@ultrarisc.com>
> ---

Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

>   target/riscv/kvm/kvm-cpu.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 1993bd446b..45ad5e1525 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -910,6 +910,13 @@ static int kvm_riscv_get_regs_vector(CPUState *cs)
>       }
>       env->vtype = reg;
>   
> +    ret = kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(vcsr), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +    env->vxrm = (reg & VCSR_VXRM) >> VCSR_VXRM_SHIFT;
> +    env->vxsat = (reg & VCSR_VXSAT) >> VCSR_VXSAT_SHIFT;
> +
>       if (kvm_v_vlenb.supported) {
>           ret = kvm_get_one_reg(cs, RISCV_VECTOR_CSR_REG(vlenb), &reg);
>           if (ret) {
> @@ -966,6 +973,13 @@ static int kvm_riscv_put_regs_vector(CPUState *cs)
>           return ret;
>       }
>   
> +    reg = (env->vxrm << VCSR_VXRM_SHIFT) |
> +          (env->vxsat << VCSR_VXSAT_SHIFT);
> +    ret = kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(vcsr), &reg);
> +    if (ret) {
> +        return ret;
> +    }
> +
>       if (kvm_v_vlenb.supported) {
>           reg = cpu->cfg.vlenb;
>           ret = kvm_set_one_reg(cs, RISCV_VECTOR_CSR_REG(vlenb), &reg);


