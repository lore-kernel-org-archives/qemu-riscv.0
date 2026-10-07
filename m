Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A88CA5FF1
	for <qemu-riscv@archiver.kernel.org>; Wed,  7 Oct 2026 10:21:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xEOlh-000062-Sn; Wed, 07 Oct 2026 06:21:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOlc-0008OB-Mk
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:20:58 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@oss.qualcomm.com>)
 id 1xEOlZ-0005x1-Rj
 for qemu-riscv@nongnu.org; Wed, 07 Oct 2026 06:20:56 -0400
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6977jeMO3194063
 for <qemu-riscv@nongnu.org>; Wed, 7 Oct 2026 10:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8/SurD68nXyh7KrJYWRc68g2OQirUq0Z6kIFNUFis0A=; b=VV/JXJSx1JdXmQBM
 U4O4s64/ogyU40lw7Z0j2R95CQOv0NOQWMSBtN1Jd6006o/Zi4i6KixLCf9ELX4n
 6FoU24aN3os+Vgdyfe3l6Hj2UxiF5GWEBcCaj3TkhKBH8FfNwBo7/G4Qg+EzKP6u
 L1EVDr8ZeYRFmOlqWH9lt7jVJ3WBWBy7YQO2S85RWGaOmonTagxV5HCgy4KfPaxj
 ocBJbvFZdgEewaLkTJZlq4jI0EAgGlxaVabW7H0DM7tT1LUJol269YlodaPz6sr/
 wjTtvqWbNVmaEe8x4wxiTmA9QLRBEZwdWl17PtzYOUi88PKh//I9IHU/8Y2CKoc1
 S1ys9Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541ukt1n-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 10:20:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93a1de6d5c3so825649185a.3
 for <qemu-riscv@nongnu.org>; Wed, 07 Oct 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1791368452; x=1791973252; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=8/SurD68nXyh7KrJYWRc68g2OQirUq0Z6kIFNUFis0A=;
 b=AJp1yD5fwH/njqGWP55gX6MKHL8fgNWNKJpKF8AYITpE8JaszQtSsMAm9U4WKOv3O0
 jSvQNXEeXwvB1kpSB9QwFRTg0NB0CnxSB1cR2Gns3yQJq7fLGc18y+ZvvLTK+QxREDfk
 FiSh9uQcwwkuLdjxsDtD+S/wcSls0lRCcZ9UbXom9WMfweeFhw2NhcdbPyIEAiDJXKPE
 PTI6lJRvyjaD+pucjkY0MUYvNnwijAzjrvEvxDjD+QZOAlRrDPjWVsDwkqUDsR2MZWiO
 51s8r22bgJ9gzAoE9Cu7hDvwkgtQ+gZjXlfxz1ipcM0/7b9jfT+aHtNgWJddjo+PvjT+
 liXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791368452; x=1791973252;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8/SurD68nXyh7KrJYWRc68g2OQirUq0Z6kIFNUFis0A=;
 b=NvuI4kaV12PrZ6TOz7fuw232ix3qC3S+JQHqbdOJfWUJWNohmpsn9joeE+2TZhh1Wq
 3YjGrlGXGIH/YUU0euYIBLbW6eb70JkuPM5Ezk15xubUIcqnhXk0u/Pg99EGgkaZ3o5M
 hRXzaWLNCskVExyL0HvY5DfyFvenvFVrZJib8TZDy0jo8SnECfA8sYqddSN0x4fw8v65
 iFbDLKpZQbrFZLrvdEM8IZDHHUmIkIoybTOcfxTA1le8n8Nq9PUSQ1TILMgvgSzk20h4
 xdVBQccbFlV2KQnSQVeZNAuFmqB3ZFUVZnOhvKyrVqVXJp5Ebs6MLcnE9OOSUm3nZn44
 AYaQ==
X-Gm-Message-State: AFuF++mv8oFG5WbKo8ZpP+Fhy+gBfxwxV+HmogA/O+nfQbLrnbw5+IJx
 I6rgCvekj0h7kDr4lKsbyg7NMWjDhKXz43qQ4izVYu0M13PQqllEeidMnFcXx15Kgt+h6ukiAZv
 F5DWdGITK7MfELT+H/N4ipUXHbWBG01kuwuzI0VTUEg7XBNrmSLISDPMkj5gkTsFtYmhe
X-Gm-Gg: AYBFou2Bg9jmha3Q2Zo9OhYyYaAs8JQh8sifer1hl7pQ2fyBTcV9Hdiy7XijUQ5XogF
 /OJvx8+Pg8lFJcf4XGt1w7uL7SWuiCt6Oc46IHCi9cLt5pgCiO6YMmDP1jXOOYoBgxapq5NmFrv
 X3dJlA2cy3C2MsTDD6Vn40tmd+Cymmk2gAUr/Aszb+8kwmJvaY4Msc9O6SAhVEQFZk7qNgumDbE
 o9+9b7QEU71xXy5i9MWWmZFSfHHPRrzfm6ItQSk8vDaD/6aE4vy3FllQkCyOnHSU3K2HYqjwVWQ
 BIPug7z+vjFO7poCE9VAddVzWMiTKwoT//MqUxYQDV7yOF+R1ttun5YOW6scHS9RstA1PVz5hpm
 OtfHjApucSa4bDGBIhNjB1ltzKoJw3VO+kQ==
X-Received: by 2002:a05:620a:46a3:b0:93e:9809:279 with SMTP id
 af79cd13be357-93e9b8a0f93mr303839385a.81.1791368452236; 
 Wed, 07 Oct 2026 03:20:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46a3:b0:93e:9809:279 with SMTP id
 af79cd13be357-93e9b8a0f93mr303835885a.81.1791368451638; 
 Wed, 07 Oct 2026 03:20:51 -0700 (PDT)
Received: from [192.168.69.210] (pmd666.hd.free.fr. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f54a650sm56001075e9.4.2026.10.07.03.20.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2026 03:20:50 -0700 (PDT)
Message-ID: <f1f216e1-9faa-4b9f-b704-0a33ec0f34d3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 12:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/18] target/riscv: Stub KVM functions for
 machines.c/cpu.c
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 pierrick.bouvier@oss.qualcomm.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, luoyonggang@gmail.com
References: <20261007-rv-dedup-v2-0-8a2f0f296a7f@rev.ng>
 <20261007-rv-dedup-v2-9-8a2f0f296a7f@rev.ng>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20261007-rv-dedup-v2-9-8a2f0f296a7f@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9gma8ZF-HDn48LMWZ-IyFfToVaZ8c3Ah
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX6DaChQImHSHj
 CgRjrLueMvkaQeqRCMycupKhiOpDEc6SF86RAuCpwWf7oKRoxg8O020goAY1bi5LpHw2GY6d6Kw
 Ujfo2tMm8Vek+zf+67Dtk9K8kDUOyVw=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac61d04 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA0MSBTYWx0ZWRfX55Jx7ZKd20IH
 H2U3k+ckjdcMy3LO1zk60ngfGrZptUcr+hdgxaA6q68U0JvALCxNJxt0VwpGL7u2Qig0MdHqahu
 jBu3Hpeu+kBi70luBQL7uDQYiOExCzFaqpSYG6KwGwfpnUuZYry1Swme3XUdxCikBR/kkC1Fk6t
 +NgNMe6sEpBzI0Suq0ZtyOlCpzq5Sb9WF3cX+pX8A+br/9ygUU+AJkryXN1VmdZ/01w62mgYSFS
 QXiP1aHUaPMO4YcIK55aGuslwrPVuyDNOBZll5Qv31xKa07ZpMtCNE+qCGsl0aKpV0LMvLEGCzJ
 WtRuuuJDWzxhmhFbjKotbZcsmYoTnDni0cpkyHwQM2CQOnXvJYIVWedK4fJF9ES64zLk/ErOIu5
 /HE9hgJr2uYvJjzfoNGmyEQOVDDy+vRkRi/oqFcXUPe4pmIUecyimC3VmnV9gpZCConFtEuXg9f
 M2gHrkWRLH667gPLJ5Q==
X-Proofpoint-ORIG-GUID: 9gma8ZF-HDn48LMWZ-IyFfToVaZ8c3Ah
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070041
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=philmd@oss.qualcomm.com; helo=mx0b-0031df01.pphosted.com
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

On 7/10/26 10:43, Anton Johansson wrote:
> In order to compile cpu.c and machine.c once for system mode and keep
> the linker happy in a single binary setting, we need to stub out some
> required functions otherwise only available under CONFIG_KVM.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>   target/riscv/kvm/kvm-stub.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>

