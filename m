Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375BDCA5FCE
	for <qemu-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 04:44:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xDaYe-0003iC-Qj; Mon, 05 Oct 2026 00:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDaYV-0003ha-5r
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:44:03 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <daniel.barboza@oss.qualcomm.com>)
 id 1xDaYR-0006us-94
 for qemu-riscv@nongnu.org; Mon, 05 Oct 2026 00:44:01 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 695108mD497292
 for <qemu-riscv@nongnu.org>; Mon, 5 Oct 2026 04:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hO9t4/w0U6pF5TNn8jluXiC/a05ooHCZKtC0DznAhmo=; b=QgWgz6DOPToYhJbw
 egzQE7ka5vI8n6IZDAFP3z+/VQGq2VQKQ3aAxyA46NgSuWvRqHDm0MTabgIOJLic
 /xv5sgE4VocC2EtXNziscMn0NT5YhXJjD7J4PD7vqxaz0gjWtC3bzelhVr//uyG1
 FDkDopqMcV1Q2glewRDgOKHUPCnWISolbvKqO9ZKYz30FsGuej6khq4tPhXGAVqJ
 ikPMDpzR85LWzZ2txJnPIxrX6gReUjjtXVHlCrftC+XaRCuY+KvTyAsUVdPO/Ft5
 OtFSFO3eiRV61HzBqrhnvK3tPwfiyALg11de7VAscWglqEKU4Mb7hzjFG2W3mNRj
 W0xgzw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyrqbe-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Mon, 05 Oct 2026 04:43:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93a3f673221so297772285a.0
 for <qemu-riscv@nongnu.org>; Sun, 04 Oct 2026 21:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791175436; x=1791780236; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=hO9t4/w0U6pF5TNn8jluXiC/a05ooHCZKtC0DznAhmo=;
 b=gddJ2QbRGLyvLN6SBUsr6mY3Ehd9BfqIHCUo1fSllb1d2NDCj30pHd4D/q7Vz0QRrE
 rS/G92bWwzgUGaX98Ets+INu+5yU6sdUkVz3x8foY3DZ+BcZvxMRANlOu0MVkCR3SwPN
 ARpVfdrVF3gLkfiS/QRhEwH46LuubKptxS0nwaAh1NYz5iJVjUXV2yoCvwVVSu/3zjBd
 a4A50Yiz+F+JcHoV/ANHn+HJyE0W/VGrsITGhc7PFmbMzxU/AQ2CuSRDupq6AioFlqdT
 dsMkQlQW90m8JCiVAAaw9lhaJ9u391BbqsLQdP3JHNh+Rj/p99UuNx83XwQZ8oHtMxwT
 eCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791175436; x=1791780236;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hO9t4/w0U6pF5TNn8jluXiC/a05ooHCZKtC0DznAhmo=;
 b=Yin+lYaSF+8XsbldAg9AjyeK8AaqjmlH8sMFULJTE5m6i/7monFpt7dih7abdmfuGJ
 8eF4D0ldQJmMHPJ+iH2/cA3vd3Ld3sfom0P/asbK4QTISqLp+BB0+TuqCoMHxQKeNjj8
 naHDWs8vdqsu804hpNLKpMHW8kvrS1PS5B6R5OGk3q2upi/a+H5xZxc0DWaYUAxy1PZU
 ipQ24+ct3YPFMteCfR4RC/F/6d3ZV9mrKfkePpGPBcwYOs/nnoALKNVqo2/h3qsUDbk6
 1l4W7OGkj/79B8pIXf54NpgFtfgJptBT5/OsBKLYMz5T3zaBdR91PvEPYZZeDRKFJT68
 ZEwg==
X-Forwarded-Encrypted: i=1;
 AKwUvBy8cELwXDFa6GI4SfacmtBrb/457BIbU0j7atlN1TNXIKqOOs9AIZWfwJPxdzM11S/nF1mxGYdCQ51O@nongnu.org
X-Gm-Message-State: AFuF++lmtAe2pqS0zk/X1jxDOZ5aTWlgClbYvmwpTVcIqWG8fPdAuVd/
 VJrOV2B+pG3qZvvagzKzB7NJBui13A+5YjDTr4vpZecWe4em2dSLH72SYbV+Ea1J50wTYrkjhS9
 EoXslQIQ9YNcRIMMSxA9ZY4bI7FRR+4TOlD72qX9R2eBC6nZN3rqaxAo1Lg==
X-Gm-Gg: AYBFou1uvrrs59n1o5BjPqmU2MWHX5Lfe+42dFo7OHJg4BJS/Q+0PgvbjpmPW4Frf6q
 RK/8kecuRKYQpxvEgbfnreg+p8amEexinxoSkt42jM3sVo2mQtuRc7CXMau8zSz1Kc+FokKWva6
 jmHSQmf2klNVJsvZWhUHJesuUC35Vf6qj+/TmazCgkH5o5uNuc9u5NgitxXQKVvA5HNNPH40ENT
 KDcsQEvX4iHVsNOApdPhsUbEYnVcV3msiPxvlrOX2bs5wsXRuGBxDGPj5iioI2DnhN8uaDM/oA9
 b68hyVlUYbWu3mcZlCkoxEUBJZ0YbQpHYumdGCoRKIT3anMxd+Txipnh8icoYU537R2C56scTH2
 HOIJ0HXIkKxz233DwoFPUMkVAUiWRoW/o/GK6
X-Received: by 2002:a05:620a:d96:b0:93c:a468:2db1 with SMTP id
 af79cd13be357-93cf18acd27mr1870813785a.58.1791175435676; 
 Sun, 04 Oct 2026 21:43:55 -0700 (PDT)
X-Received: by 2002:a05:620a:d96:b0:93c:a468:2db1 with SMTP id
 af79cd13be357-93cf18acd27mr1870811185a.58.1791175435099; 
 Sun, 04 Oct 2026 21:43:55 -0700 (PDT)
Received: from [192.168.10.208] ([185.243.168.149])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93cca209601sm796946285a.20.2026.10.04.21.43.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Oct 2026 21:43:54 -0700 (PDT)
Message-ID: <b1dfa965-809a-418a-9afe-2f2685abbe5c@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 01:43:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tests/qtest/bios-tables-test: Allow changes to
 riscv64 virt SPCR
To: Rick Richard <rick@sloservers.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>
References: <20261003161248.38903-1-rick@sloservers.com>
 <20261003161248.38903-2-rick@sloservers.com>
From: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003161248.38903-2-rick@sloservers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: IWyhzMha9MOhIp9DbpPoj0NkEvWh-07k
X-Proofpoint-ORIG-GUID: IWyhzMha9MOhIp9DbpPoj0NkEvWh-07k
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac32b0c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Adc43iEMMYzOb2FTIT2GVQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=F-tV29oOAAAA:8 a=EUspDBNiAAAA:8 a=s8KuVkPV-ZGQNvTNGtoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Y2dezMJzicAI2PZykhZh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfX/gqg2tdbXhIg
 NvDjIUbG6Jz9ddHVsauB5K2qHRg1/BvOKDOu9FU5Igqz83wINumVQkupx9k8yMHIO0EBG8ErtXN
 PRIETHjM78spQq/GqeS8Gv7duJEuMcWxCtLNWQ3vPZTP37cdNpEQX1QuTX74CI3hs4pQWApgBFO
 +pewCXG+CHV8jWoJd/sqiOOlM5HNBYKlVONKIzp7elLkpaFfZ8jrg21NSnaK/ToqFWmqrYL+Awh
 YYeDHb0aaTMJigsp8KtVto1Ar1Tm+kXqvmnDLWgWgsVVppEQiA9WRaFJKGxRlVq/xWNWqRNklUU
 G6YypxJIZ/IWIl8urEAffGGIM36tGFDqvqPp+Z1x6AH7wgG5NUl0Vwtuk8puR52DCGE0a0zX2bF
 nmz14rz/6it71762XDSfrMEyxNRZpfR4reCbmGMKmdairI7NANZEt4nc/dkNes4Q/5Ckd3fdhyI
 fP9uhaPiHL2iuxWixgg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxOCBTYWx0ZWRfX9tYqEFZ+9hra
 Bb1eApaxUp9GrAk84JjqgPpodg8DH+mps0wsrGYeqnBbDvqk/g8dtQ2YQkhfdvei83Y4RLd1D7v
 C3gTjA7/jN5rS4ouzRZcSTc8jV6ZpJ4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050018
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



On 10/3/2026 1:12 PM, Rick Richard wrote:
> Allow changes to the riscv64 virt board SPCR -- we are going to fix
> an error in the UART description there.
> 
> Signed-off-by: Rick Richard <rick@sloservers.com>
> ---
>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c..aae97304 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/riscv64/virt/SPCR",


Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>

