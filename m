Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E4C5CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:11:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOzh-0001ny-CD; Thu, 01 Oct 2026 18:11:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOze-0001n3-OW
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:11:10 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOzc-00039I-Tx
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:11:10 -0400
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691Fsc1K3512247
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Ia2xqc0OjQNsmK5pIGrhiZdU+vDUSUSvtMZIubG85JU=; b=o3Ud5phZzRyU1ACj
 CoeX/yTah8oYKbcezShUwsB+8620TWtmTApah5AyTKjTFnQ8Cs4q6TPBVTuiH4wu
 JBpF5uiMCHUov7dbb+rYCTigs2Cs2uL4XfmaHOQHIBN0iTnD9hpwh2IJxt7xUwEG
 uaM5BW8dFPf45i9+YIpwhBH7wnqzL4EQ9XuiOLZs4OLl/HaBA32vFHKYFg1LvtlJ
 6dOBn3al2aVPGaDGKJ7slvXImbavbivunmUhQiBFmUZ3eZLuUrQC83UgMn+hrB7i
 h1LSNdoS1iMCk5wGEUr0GVGsxhcsaVxQjNglPR/ebrbyZ/NFjcYCN/PRFDP2Ar1U
 8Ag8xg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1qukacdr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:11:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34d84114044so6265894eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892667; x=1791497467; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ia2xqc0OjQNsmK5pIGrhiZdU+vDUSUSvtMZIubG85JU=;
 b=kY1jDyAoQF55Qtq5LdqrOYT+z/ZqsDQs69xxnJTpyYXSQoHH7l7vYRWr7iCWM2ts2n
 DtAid7OHx/bRQuk+3OVw5U/yOLoPkGvfpMsJHyPJyFDTaLgvam7EiVl3nCAcj4Gf9pfH
 wpNyAOk6ql2YkW+J1+E+1Z9KOR6D5WoN2c3zshfZQ1lv/1LrKrc60jB9e9xfDUpA9VfB
 v/c9AoE0szSDWghIxkgH1uRKp+xj3fbIYFHhmIAPfMbtweNcecEKGY9r9gL+NraATfcG
 rBc0KVrejQlmmgKa4U5v/v0vu4AQzl47RdwPyAidCt1ufhtQoy1omV3UQR68S0LgYYDo
 ucbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892667; x=1791497467;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ia2xqc0OjQNsmK5pIGrhiZdU+vDUSUSvtMZIubG85JU=;
 b=hii9OriTnOvlmIPf3ERc1y1jYCTmbg/FD/nGyM1qa5lkUQ43x7d3FHjy2nX41KpGxS
 i7US4ziW6FiqQq9k4f6PLWLIRiBEs/FvYnmQIDJZY118X754d5mGWB6P3cgIR7liLTLv
 odpkMg8Jl3ZULmGIEuVC2pB/7YNMM/nSTxwnwQoj7o/J3BUCzT/6SQtiF/oey3VcTU5V
 vHV5YSipwuDQrL7rMsky5M0TWE337k9i7lXjHZz0fTb0j2aaV6DVn+DTfGqaWB6rG1yq
 EU0AVRxGJDB705vWnMGfS5CqO2ynL7SberCYEAGninGIaGByXIipO11j4S+6enA0aUP2
 QabA==
X-Gm-Message-State: AFuF++nF4SD2xei/8A6DJnyfjtzwT2M62ywihoNXQ2aQVWaHWJ0JtHQf
 j2jm144yKOKbJbiH3jucU2j9Mf96hjZO3KfhUye2MmbP4ODpfP90pbSW2BwEH+jDbYJZahp8xcO
 NFLuclyg0GzGo9EFwvgXAg6XLAnkWFTEwk1Ru3KATrynxB45T2VRH2+wAGw==
X-Gm-Gg: AYBFou1I2y4kMKxmHvJ0RPgWUwoQ03isF3O3jHZebFqnmQ1MpSlBv3W2LWxy2cxcuFl
 B327B9yX7vTOoIJ+BBl2LEVJxa0Bg7kjzM4NhHwtXE7DI0O0vOitF5r9xZeYF5pSO9VzoW794yp
 3RSwUgPU3AiZRTPAEtu2U/LGqb2PHSXfOwf9hcS+1wgkOWfa00bIxEQls1FeKNrhJcw7bvsX+XC
 8x+PDGL/hTeOEEqsk20rK0QXQlUoyqIniQCb1REZtqx9OYSbSRxsywDFPTnXbk1Sl5Eu6ZzRQFu
 2Cr3NM2iIILGPSW8QJw82g4s7aSt9OIvb5iwSufdqPFbWYkigZPA56N5kyQrpveFS6QYkcjjaOz
 dprmqW9UNNSyo6Z1fjt53GQfCBnPChJagn9doqq1UMzC9we5yEGXThpgWtkUPWzx65Qui5g==
X-Received: by 2002:a05:701b:4588:10b0:14e:d0ba:7590 with SMTP id
 a92af1059eb24-14f5b3112a7mr637360c88.15.1790892666520; 
 Thu, 01 Oct 2026 15:11:06 -0700 (PDT)
X-Received: by 2002:a05:701b:4588:10b0:14e:d0ba:7590 with SMTP id
 a92af1059eb24-14f5b3112a7mr637336c88.15.1790892665921; 
 Thu, 01 Oct 2026 15:11:05 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f984e4sm1045491eec.17.2026.10.01.15.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:11:05 -0700 (PDT)
Message-ID: <a9ae02c4-5c7f-410c-b1a6-29c8ff82d5fd@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:11:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/18] target/riscv: Stub KVM functions for
 machines.c/cpu.c
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-9-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-9-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX8v8Ozh2s7A00
 xLlofKnSZOJNq4SBMluQuCb8fpkJupwwz5f0UBTmIDUZwsPHszItOVQfD++Flg1orNSVbngXtrK
 C5HZrjvYQPQknyk415i2eaDXunoEgyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX4uDvZq5x1aY1
 0FLZGmxS9kNY0lEZaZaFtMU8RJcB9dSzwzd0JxdYeSspJphdc+m77OqgQxwGmSkao4RwJ+ZmNfR
 Trr5l0tO1CjWTTO0S2Oj3ZDx7choac3Ki32SxNuuURpleD+LOEGxEvS6TkpjcCYQrMnGqjOTGPS
 O07oHiT25DwKib8ckBCfSi8LUpcTOAW/B+wsazo5kILWznHCjst2DR1lcZiIU5v+aooMAclaimX
 7PvNmcNmAXB8FdKnV3eOKOViOwqz6+83dp8N5wGAKJJW7kLscYlAUgpAWj0IcPxhJhyRV1NyCu4
 wISv2Fh7gLungQLKKu7qesIkjln+RH3PpmLPgG9iJID6l4q1Ei4GsVb/U5SRnSBavuzYxvojRkx
 yzzi0EEfrxjq1IBu/UkW4LnxX5qQITiVvZoWzUxsRdFtSt4gwLbeBl2wVPu/rMDeHqzJ/PKZejM
 CU9cJOB0xmlJBmrSyYQ==
X-Proofpoint-GUID: I5pMkYL0ToCvj1_LEn9G9NjkPeihOTrz
X-Authority-Analysis: v=2.4 cv=TdADJhQh c=1 sm=1 tr=0 ts=6abeda7b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=hgEYH4ClCF-yA8-lyV8A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: I5pMkYL0ToCvj1_LEn9G9NjkPeihOTrz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
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

On 10/1/2026 8:59 AM, Anton Johansson via qemu development wrote:
> In order to compile cpu.c and machine.c once for system mode and keep
> the linker happy in a single binary setting, we need to stub out some
> required functions otherwise only available under CONFIG_KVM.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/kvm/kvm-stub.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

