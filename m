Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D1DCA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:15:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP3c-00065z-6G; Thu, 01 Oct 2026 18:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP3J-0005vC-LV
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:14:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP3H-0003Le-D0
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:14:56 -0400
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691HUtnD2353164
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:14:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bLhllw1lPvFsUw4K+gUA5ViqaqHdIWDlHn9eJjHjX4A=; b=ZnJkjegcPmgj6U4V
 ulPEmdaF3MOnU9txbAY3jO856FEV6DSN8kXD8sFsY0bQspeAM4qjFAtFhM3vh2Xq
 ujk/3bjaorNGWecen9jsXyH4SQBoinmzM1PDNtmzUo+a9PJdlZTrjKRAu6F93z28
 h4GEWLRyWfyIS5YVaqmSbEFcoqkbSq7EuiMVthaTZgqiqZshk9gfdybDMKQiTUe/
 YH08y0kfbjNcXHHRx3JMcCLivHTrvXpYVoXSyw5DtDCMG/dK4QlQvCajGqcWrOIK
 qa8+IbO0wgveqtpFkeri4TVDhyapOkgXqiZeeUPTir+0GeviWSK7yjHaHpmzMXtU
 a/q3Vg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1v031368-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:14:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-34ef5fd7934so1291077eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892893; x=1791497693; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=bLhllw1lPvFsUw4K+gUA5ViqaqHdIWDlHn9eJjHjX4A=;
 b=TGLD8+dEkoBgP+ga9amKIbKYiSqYfaZ3b97fWHEOuNIpC7aoE48JqVlnXlYCvUjtFy
 ruduBIB613oVG4XaExwbI++4RvYbEi9rcG5UZ5th3J/Z/4B9FyP7jr6u1zlOYV1fsgR0
 qKdJRrahndF0d+qDKf7FNUKeq/6ehmLMI4QiDvepscGxcCMoesTaPsuvU3D1hc51UIXv
 0UG8bwrJt4TQdi3+vQYJRU3LEHys8mDiwhHob6nj9p7xaMem8gyi5cSn4b9Av/uLEEqE
 NJHzLXGG90E0RdWd0TXGbNzSral7wFtJm/BVYXl6Nm1tKEg8//YQEf9t/FYIqEbN97du
 1OrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892893; x=1791497693;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bLhllw1lPvFsUw4K+gUA5ViqaqHdIWDlHn9eJjHjX4A=;
 b=K+CymNJzkDLgIfZ4WbLX8jKK2P8NxbL0gLFvThtUjOO8xENuOY7nJUwjum90AVrzip
 skHJLp2sxLhntHcPMp+SNoxNJCt6vcC59Pe3YgyFeMiJmX+0JkbeHSIBt2LdV44Wsive
 n9fHwR7vlYP7a7KSkeK+G+z1pQn+SHjA44orHYcknJSoxUW7WbtaM6U/IYduOGQzfFa5
 YpYq7CKbRLHe1U1SRgSHnvACXvH3ph2x9kqvLpfVe7L9WjHD0/I92lu44Aw3zbj0u5Gm
 nwulK0M4A7Uns8e9fEQzNaO5Kt4h8z8guNrFNfF1DbH7r12+TtIOjIlw7UmZe4RqBzQK
 +6mQ==
X-Gm-Message-State: AFq9FYLfTwC2Tme6WWU8+/Th8mT6Kx4hMxxA//C/yYgyDA35tL+cA/vd
 KF8Kd5r9xHznRD9JLJmb/IoTzYq7FMFRK+YwJ0eENNVUgzr+rcgitif0fncLBLmXYDWdpyYvsU2
 zbKZaOsQQmLtsGoCBJVNLgMCXjYU8sfXuzCGk+UNpyTdS1kaNtC2v+jJSYw==
X-Gm-Gg: AYBFou1B9BC7wbOaPHtyZ/BKCCXaOXOgPADhYcVy17IQ42ntHVnrnbmT5V93hioM2R+
 ZUKRibulb6wz8EK/4CzMV4YpceZ5LA9CUyBDTwMECs9PV9/7E4WJ0357pPfNjDxkUaG47ElIcyd
 5H+kV9tU7md67CxSTp1rkjzJZJVBLBj6n2g6S9JyFiw9y5Y2XX2JbgDzRPmuM67IiStqRYRbWiE
 TvxrhqU+h08rdulrOzTgAF8Pc28jw8+nimUg0NazTSYiITX5vQl1hoc6wq6l9n7W2nFsgb5IWS5
 ILvxUICM0sRBs7YhDFaXscOYWZg7qNKMDw021rPh3TcaK79QnojMCg5T6YOt6FbSSFHHHNhWQcC
 5LOQmw5QDadADqgp/3H7HHJyZlrIvYVPjU48TOXCHSegFlQHrOabt3QPqYbGvBIBl1NKQeg==
X-Received: by 2002:a05:7301:83:b0:331:89d6:80e7 with SMTP id
 5a478bee46e88-34f1506686cmr692209eec.13.1790892892967; 
 Thu, 01 Oct 2026 15:14:52 -0700 (PDT)
X-Received: by 2002:a05:7301:83:b0:331:89d6:80e7 with SMTP id
 5a478bee46e88-34f1506686cmr692185eec.13.1790892892240; 
 Thu, 01 Oct 2026 15:14:52 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14fd9698sm1101288eec.23.2026.10.01.15.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:14:51 -0700 (PDT)
Message-ID: <e33c9fc6-5b6e-4b96-9ec5-e75f1665109f@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:14:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/18] target/riscv: cpu.c unconditionally check larger MXL
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-8-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-8-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX1OWBDl1pYqd5
 zWkaqHgVUPRzUCRCiNxpRqZg1bYRi1RFpAAy5maR6CMWbkN9GVfgbj/ks96OoBPQPnWL3WGTYaW
 LphAx1ctMCdnTAxs3mxxE4XozktSWPM=
X-Authority-Analysis: v=2.4 cv=GqfXaU1C c=1 sm=1 tr=0 ts=6abedb5e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IYDyM7DTYpwxc3Yv4xYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: xAPAVnuGJJa9rdBjvvbtpfeixzoOGCSw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX+eQGxAOY8XnX
 qQNkqBJRT2CPDPxpVEFMUB+F97THVEBO0OzTjo8QH87HD2P+DFZCHlPjNwWuwYuko9NLMa2Bs8T
 FI8wzcUcKzo7edYrPUrsw2KIO+IWf6nQpssqqbMr5iCYQWgvd8Ma1DFxFjM7X0rNsHeUDf3WFrS
 MAsWvzh13yjsJGpiyaysh97qr7+fHqjcqKBV6o0t13HmNl3f+3/vQwoaYrfh7/igXkt5uojHTPO
 pZ1B50CS3gQnrSqD02hwRu34LN3jyi592cW1tPfdZwKu/9J/dT9R8kyOnUY9hhMnrWph/hLhETa
 zSseH1bw0c63gR0GSe1+q5RFX2+kTOjae7OHnZr3AjVpmg7VsomPyLaxkbVBOrzT6o5lq2u0ifp
 D5olmQ0tkwKloMz2k50qxB5KpWi4ocGyaja7F68qwC/61fUJ0z04Lm4zs/maJjuDabbMl1h5lUU
 8+w6Ezzg4Jio6uew9nA==
X-Proofpoint-ORIG-GUID: xAPAVnuGJJa9rdBjvvbtpfeixzoOGCSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0b-0031df01.pphosted.com
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/cpu.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

