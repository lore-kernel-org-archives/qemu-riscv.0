Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2EFC5DF86
	for <qemu-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:17:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wweIM-0002WY-LO; Wed, 19 Aug 2026 07:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wweIK-0002WC-WF
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 07:17:21 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1wweII-0003pG-8c
 for qemu-riscv@nongnu.org; Wed, 19 Aug 2026 07:17:20 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 67JA87p13216350
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 11:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 l/qNuko4bcfaJ6oPDX5gayjrFqqR5dg1l6+zPcL0Qrg=; b=akmiWcx+53b2qjcr
 SwtCFeCimDLCDT7aXSMdn1UYRntTAQ8t5/QdgNy03jc8iBhwN7+l2zRVeho/JK0j
 5+cTUpzQWZuSKu1CsY46+o+iynhhBKUhVZNUE0ZDJWmVed2iPiii+0aKZkFBervs
 rsE6IHKL4P2agnHvViQppyQCym5tmuRY04mNpKkv5yA5aB2MyIN8ucoi3iAu+GhG
 OvHz9JBdkK8vi1NxSVzesJcmkC8dxCdfBy43Os9tQXtPrUL7aAtDn/rIZLrAYje4
 KDhV7/oh71DTSfXH94ixu3d+dgj2AeI2nq5mIOWd9wFXZ98MfnpOK5ext3RS5YJ4
 FE2z3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfm2w6n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 11:17:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-9308eafb465so178711585a.2
 for <qemu-riscv@nongnu.org>; Wed, 19 Aug 2026 04:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1787138234; x=1787743034; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=l/qNuko4bcfaJ6oPDX5gayjrFqqR5dg1l6+zPcL0Qrg=;
 b=aLnNBnQ7tRWruv+lNXb2minW/1ZrqG/LiDXLdxHPKUgNpRAGavLVbf96Fij5JXTncy
 deYqMN+p2YeZQ4et1X6+thVmIXZ+EEv3WxkVxSyd7cD4VpW6kP+ZfktC2fIx+bD5Ug4+
 GmPa2vhlH42i6pMLPlPz1k+VDCP/oDSATuclGBFosyScpwmZbXOQqpZOFqb/RCR4kfqp
 VpTnriQEcjX/8HLFYjUm71iMTA9BRgQ5ZDT4T4GTofaN/ijp4joYYysudNtDCL2KmOKQ
 IBauMHXr0Q6xyJjeZEDrFzp9jbDjCODEodTvaLXP/zcPo9p8mbhYU5zMdojo6ln8CyHF
 xl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787138234; x=1787743034;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=l/qNuko4bcfaJ6oPDX5gayjrFqqR5dg1l6+zPcL0Qrg=;
 b=rfADNuvE9RHh/RuLIcgtFjJcdOCPzWAfc5LepEvWCZeHtiWpnun1sOsn0Wtvk4MnE/
 Bsi5l0F22kKp8MoDuHI6ob23UugO3+sb1u0t7Zx15d+3GXtmEGbNffFuoGwfKoUv10GB
 X1X2OKO9ut8gFEIoidfN1BZ36btcfZu3Cj+SPo4fEPQKNK1zC71UEPcgomtNqHqe66s1
 I9OodrX4aRQzLhUrrD2o8W2VmX9Sely8V+45N+iFoeaDHN3v4I6Xp7Hfy6UL2eOx25hp
 8590wescmZ02Aa4ikA6XtSDX5nmfwAoyFFXsCTpO6vFqlPTqV7nXr5hhliGqeYLhxJ1k
 zkMg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUJUoAFlyIyi+fOWJVzCvf+hCFnaAbGiqj7qn7Y1xNK7PTMPSSiQ9j5VZPsUu7I96EZLh7EhQVeZRD@nongnu.org
X-Gm-Message-State: AOJu0Yw4JCkAi86KXb5z3KbTMbhQgh5FW4wnKBUTZL3xiRdgO2l0ChOp
 5h50cPA0uSKJZlLGokirNeE1nsQkxlAtONKKsR7lNchRwP0kXDXkP+H48wObQsR27BdqnsBD+mC
 ze+8WZCFY6yPVyrmDQZfdSASWf1CqoBmGGdKCRI9VZv06COaiA5MXGbNcgw==
X-Gm-Gg: AR+sD10CwexuZ89o7JsOwi9tn0dYvhn335r4s/XcODbIkUrI5W5YwCCUqcsRYujKyux
 SkEpw7ZmQSMP9wQTqDv4T0hE8tjRCZ3jdIhqBhLNVnf7P/y7R3tOcSmPOXIPBI6yzaGUjpZZCwK
 rrT8g46NlfJ6mA7655LYxHpj6Tj5xKbiq3crbRv9Pe/AL03K0Xz0l0LBJkrzb8S5R11+5qOq90L
 74QgDg/aVupXE7bFsyN23XRGPlCVT+3NTMjSoFh9t55JWt5RuXj7yYBEMJTHrPpFGmNTEaYxIH/
 GvfJ/8o/QH/CVp3yfacKPJoj01tDMiNP+zS8gU30FwIpFghgcoWyS8EapAI6tvA5XUWfkh4OosH
 Jjvacy5yjowxfiORBa20YvWCtreLW3hQ8p1Y=
X-Received: by 2002:a05:620a:2814:b0:92e:6122:130c with SMTP id
 af79cd13be357-9371e30bce8mr377539985a.34.1787138234032; 
 Wed, 19 Aug 2026 04:17:14 -0700 (PDT)
X-Received: by 2002:a05:620a:2814:b0:92e:6122:130c with SMTP id
 af79cd13be357-9371e30bce8mr377533885a.34.1787138233526; 
 Wed, 19 Aug 2026 04:17:13 -0700 (PDT)
Received: from [192.168.69.231] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499a9aa1594sm50480115e9.0.2026.08.19.04.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2026 04:17:12 -0700 (PDT)
Message-ID: <c459a001-57c5-44db-b292-45adb70d26d5@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 13:17:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] target/riscv: Handle [ms]status updates for rv128
Content-Language: en-US
To: frederic.petrot@univ-grenoble-alpes.fr, alistair.francis@wdc.com,
 daniel.barboza@oss.qualcomm.com, palmer@dabbelt.com,
 liwei1518@gmail.com, zhiwei_liu@linux.alibaba.com,
 chao.liu@processmission.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org
References: <20260819105655.33391-1-frederic.petrot@univ-grenoble-alpes.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260819105655.33391-1-frederic.petrot@univ-grenoble-alpes.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q1RJk9kEcGfLL9kmuW7R_FeGPdnXSXEt
X-Authority-Analysis: v=2.4 cv=bth8wkai c=1 sm=1 tr=0 ts=6a8590ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=4iTf41tvTbLCZYnf8zQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: q1RJk9kEcGfLL9kmuW7R_FeGPdnXSXEt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDA4NyBTYWx0ZWRfX5U1VCLhxA87f
 9PjAXnM5d6RxLx0UrOyEEnAAAr6t6XFji00tq9Nbby/gk3/rRevDVyeOb3YI/Y8lDJ2AVyQcJel
 zipPkCiond5F20RrPlm42DDfS432AVUppfw/yErUdSHnumq2+T25KUKWt0L8lyX799xYI9RJr5S
 ebflwAX6sqCWgpAJ3k+UEEnYLIxSEjiDctZh48DE+FkNUA8oFSnKFcSFTDSyV6QoVu1SJ417Zm8
 PkS0l2IQ6tRrBVJM56izfHQjfLkBJqX19qDdzZX6SzOq8riA/1+BQiBhvuoev4aX/vMTJaH9sun
 iY+Dt4/ksdDOKmmLP+nImGDGqkbvuwoWSjJ/AIXSQ/2BYRsJz3oeimRCKi/N49ukQftsllSKvjH
 xI684a/r2Go/FWX2Tjx4VKPxWAQJHsZ+8MynV2EDJXGuC2nANmSu6YoBfpA1mdV8XznJ6WBEP1k
 xDw5cxeN+cJedgz4rew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDA4NyBTYWx0ZWRfXyFih4VRE0hpq
 oT9Zi/QyL3lpI1Xt4r+j58d/JhkBpsjixZo1HO/5K5bNljd8HCm2v+cUuubYafpvAXlfhZL4DMj
 /H94MPk+WMW3IKTforXC46anenwrpmE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190087
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0a-0031df01.pphosted.com
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

Hi Frédéric,

On 19/8/26 12:56, frederic.petrot@univ-grenoble-alpes.fr wrote:
> From: Frédéric Pétrot <frederic.petrot@univ-grenoble-alpes.fr>
> 
> Correct sstatus update and allow support for rv128 in mstatus,
> provided the cpu is an rv128.
> 
> Changes compared to v1:
> - add cover letter
> - add the Reviewed-by tags
> 
> Frédéric Pétrot (2):
>    target/riscv: Fix sstatus update in rv128
>    target/riscv: Allow UXL to be 3 in mstatus on rv128

How can we test this series?


