Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1EDCD6E49
	for <qemu-riscv@archiver.kernel.org>; Fri, 29 May 2026 18:31:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wT1zJ-0001NJ-6Z; Fri, 29 May 2026 14:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1zE-0001GE-Fz
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:31:12 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wT1zD-0007iu-2o
 for qemu-riscv@nongnu.org; Fri, 29 May 2026 14:31:12 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 64TI2Iws198999
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=; b=OVqtrua8h2E2emkR
 WVYY4pDKLVsYfq1fsNMbLcUi78JtM4eFLGTai4jHButIucBHLj8WtZUoI4SM0/DK
 XgbS9buhvk/regybuRR/yPfJgjRdUMklLmebtuYfMFW4wR72RhfCuvBfR7fl5CMB
 SHjjJpuHwJ8yEu1dFGrQ8PmEhN1PqKMV/z98/7mfPqn7mF+zOZK+7lYjuCqiCmRm
 r9KKxPMRlSUI729RMILTYXD0Mgim0BX4OaBUzxEzoi63dbNNq7M7EtOlLANMaMO3
 AihqfWqD2TqEjt7DHjeVdIeNkXx/ZzW2QQOV1JHsLann2LOca8dxuCCzaDoDEWQ6
 v1xgJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efdjnh599-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 18:31:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-304dd917645so1824897eec.1
 for <qemu-riscv@nongnu.org>; Fri, 29 May 2026 11:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1780079469; x=1780684269; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=;
 b=eN5n55JPfGd/De54doNbj8TL+3LNZRzjFJMwgRze7wZfc+nE4rbP/TgiaRj4bbTOou
 Mvh2PLoQ+xoMjq63ZPav8s+uFwlDiHngHqJ/PsXzAyx6iKFau22iismv9yl1ceH3Z1CK
 K3Ws4O6k8Dw5Apw7Md14oikR3AAFsSDOwtV+YsZ4VY85GF+ldfegqKx8+m8WSKNnCXAB
 9++lWZYeATOI9vQkFkrkpwoLZPT8umgHiMwf98l47GR1yCpErEl/cNHxM4T6Aumob9TS
 LtEE/USesIUykLXvbbpJ+g5DgvCeQfcJNKlseJNwVtDGrXW7EtrAfbrN8ddJcCr//2So
 FPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780079469; x=1780684269;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pkN1s9eqDTieCVIBdC0bdo/U49JIHfXY+v7fyyRHIZk=;
 b=Har6dwiqi9rCe5NHPXPdAzn4c+pv5Suz02642p+20YDMe3nLAAWBMF0upEugM0tdFt
 /RteOz7XsRm3RTK8JHsAFXoMWjN3iEHZqO04WNzHWxXUT+MKx0J9Smcxyl3Al1SLfgqL
 ClM0re8cqiKq4jtDWGM5zhjAHQ/G1BOGlPmFyLseqJJb+mGTzoG4j/77c5Q1+MlpMFDW
 PHXPV4+HW2wzq1EYIKz9/sc82PKGi+oAGY6+EmonrFyqcer0HipVWynuwbDJNvSN+HD8
 c3JDLwPndOF1d0WmreNZ4Pp5y5keno0Xu1xpsI7D98/Zw87XMeN17akrx6kInqnlT5c6
 QNDQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ91IoAxyqxKQMNbmlWmszjH/ko2ME/CV/nU4UBJ3URpQGA/FBdiHHdJ4iKzuHTpv6evAUcJPu/my3ca@nongnu.org
X-Gm-Message-State: AOJu0YwcA8l24ks+iCCs00uXAhm+weGLMXs/I9AXmtHM9xP9nVGIW/P9
 ZbqBHwkhJbudxPKd37QFTJAsqhPdQ+RMGVZAD5FG+aDWP/WgvAqoIttJ5s5kmG/ANGg4WN0x2z5
 awQPxu+J6RvIqtRHg85+3ZgiqmdjkJBGWO/zsa+ylk0WezDI4HcoFhl+2DQ==
X-Gm-Gg: Acq92OHm0Wde/ObOx70ZtIVqTNv0OmMS+vl+lBc4k1a0SdWNmLESGKeaJqlttyWBDlR
 18oO4jriX/or6+SgUjiLbcMdUQO/8y5woHF9jebidDPVdaAChDJD3yqchVlLTmmc1zc5BHOsSvR
 S6tU2LFevhi9Bo4+/OATBY0XSO7tTHp2nVdA2d1qLrt2y91VXd9qPzd6H5ymBGqpFAGE0DtMtFX
 DNE52Wnhdj7hnr5IUMh5f1JEUe1/SLeM+X4NjFUf6hCpYQ1Cb+BSZ6sEZ5AEhVNYscx7bA0KYaX
 HfeS+aS1idwHonTRGAOquB7hRaFrEOPl9f0i2ggZ6Pe612YijQ1pqDqrTMLrYMRt20wgr3qsUHb
 am73J0a2J5GjzdXB8nHTrI1wS6k0i6HkJpdtnY2trUzXAE3JjZCAxg37ShHsouU7VCdBdiOiRXO
 VIVBLf0M7QzN0wooxPWd91MNiF
X-Received: by 2002:a05:7022:ea2c:b0:137:64ad:a62e with SMTP id
 a92af1059eb24-137d4132657mr342502c88.30.1780079468947; 
 Fri, 29 May 2026 11:31:08 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2c:b0:137:64ad:a62e with SMTP id
 a92af1059eb24-137d4132657mr342466c88.30.1780079468344; 
 Fri, 29 May 2026 11:31:08 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-137b37cd5basm1681594c88.8.2026.05.29.11.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 May 2026 11:31:07 -0700 (PDT)
Message-ID: <845a0105-1b1a-4986-b8ab-fc75639dfeac@oss.qualcomm.com>
Date: Fri, 29 May 2026 11:31:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] accel: Rename AccelOpsClass::cpu_target_realize()
 -> cpu_realize()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Glenn Miles <milesg@linux.ibm.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Anton Johansson <anjo@rev.ng>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Song Gao <gaosong@loongson.cn>,
 qemu-riscv@nongnu.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Chao Liu <chao.liu.zevorn@gmail.com>,
 kvm@vger.kernel.org, Claudio Fontana <cfontana@suse.de>,
 Chinmay Rath <rathc@linux.ibm.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260529142434.87880-1-philmd@linaro.org>
 <20260529142434.87880-4-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260529142434.87880-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE4NSBTYWx0ZWRfX7Cerg+6GjEeI
 qIpHQZyprgDGaSt4VrCLHe0WCrPoEY3ngXfuRUh552AzZ0HASGpOzTk0vdZ3eiXcemet4DANdi3
 Iom/dBsbbU6IGS31oxDsYDB/9HG1oc40Y57d+H7momSx+3Gqd4izyEKU2kbIqhdgAYS/S4/zKZz
 73++quJJLCTl9JuND8KSFWtZawwPaKKc2mH+6aWtdwJXrVHLU8pMHajS2B100zWkpDxbY9fBBCN
 vrwgqhfWLHzgBSGWZhMId7Bzo7HuLWplLd4xFHAXDG18BrCCqz+qiSTTD4SLdlnGYs+owdXNsxV
 6CD+c32mMVZdZOzYz5WvPNe+eASpoYbndWfrOntGEN9faGQUok0xxJbho7q+syHq4VyqxInU8ZD
 2Xbq0VDxTgtrX5NVazTxkwqi56BgK8lLTJtPB4NqWerDwqQsOoG3GLlJErDUuZCaMp2xeLr9Vht
 C6m/V/2sGv+7dxiawOA==
X-Proofpoint-GUID: ytnJao5uwZYNUd9tzwTAzTE2snzphEKl
X-Proofpoint-ORIG-GUID: ytnJao5uwZYNUd9tzwTAzTE2snzphEKl
X-Authority-Analysis: v=2.4 cv=PtKjqQM3 c=1 sm=1 tr=0 ts=6a19db6d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=x-YBvYG0Dqxg5h5i4QgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290185
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

On 5/29/2026 7:24 AM, Philippe Mathieu-Daudé wrote:
> cpu_target_realize() is misleading, we simply want the host
> accelerator to realize its things on a vCPU. Rename more
> generically.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/accel/accel-cpu-ops.h | 2 +-
>  accel/accel-common.c          | 5 +++--
>  accel/hvf/hvf-accel-ops.c     | 2 +-
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

