Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B1ECA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:11:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCOzH-0001gV-Do; Thu, 01 Oct 2026 18:10:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOzG-0001g9-61
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:10:46 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCOzE-0002yh-Df
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:10:45 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FsXN62475330
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 b2osu4VWN1+/miZ+Q6gjoKW/eim+n1EQ4/GWLGQ0CxY=; b=gajuH556S9w33fVW
 OvSRwAZeYGkyhaPhKV569vo9dQiTg/rxgxKVWq6BcTDi6Cue3EvWHtqGJE3HudoR
 9M7kBSapQNiP5wXGR/UzQYtv2Op1ePr2HuMD8SQCzBrHMhzx3y92S+JqLrI+Skdh
 79PdDtwGnZUyhv1zXULDL+qlhb02lfbJjy2VN70hFCVTDs2hLysi1yRr5VRfJX99
 +tyrkBvnChdN+/WPLz7S0GQHWyWMQKcj99yyYA3M/cXzXUucbSq874rg3drMkrGT
 MaUL/+uJThDm7Igi/MKiiCR4SJIREQMpvaug+A2fVKHSs2cY96tj5gKKN/ezdOcd
 RoPUPA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbg9jaf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:10:42 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-34ef0362d95so747056eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892641; x=1791497441; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=b2osu4VWN1+/miZ+Q6gjoKW/eim+n1EQ4/GWLGQ0CxY=;
 b=VGVzn1iDOXkoRVyP53euVwTrcPgIX4Xj5FXT1SBXZNw4YnapEYQMmKCWd1llCAnd+0
 7cxoEO00vXdL2eLJ088TrcoNAy3aZ0eJW9Jx9Fbqsq64eqztW4jhbO+rI+S6UvjNpM2E
 aNZRHZqZIDrGDCHawh2mNN17yc7B3JEfGfvZMgn+Mgj9zpj+QbPkPgEnF/lkJvEabd1x
 6IHd/5zm+6bS+4qCSQ2SPSqdprtXFNxUXY6qA9St9CB9vGUh5uNjp3EVuI/lppyrhjAM
 l+wh2d8EQtPGT3U+JFKkHUCzOQYK+sSpO8DCeam/6OkE4RR0dFQOpVi+1hYb1RkB4dKQ
 CEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892641; x=1791497441;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=b2osu4VWN1+/miZ+Q6gjoKW/eim+n1EQ4/GWLGQ0CxY=;
 b=t4brS42NnVYKkVODVZn4JI56Jc1YuivQlf8vAkosNBVkD/P2jY37Lvg3x6OnkIp6om
 axX0ziPGPL++GaTKS210KXQCXwQhxQXZCNUJ7IEFLl1GP08uOmxndWRZxJmrHS2xjjr9
 r4HKkCcROufIpZy6afGPi+GE1rR33q5dm5XGeVY6YH1ednLkkHab8JoJPutsXGx5zCja
 yJ9w94JbQ8UgKrwdcx1dGFdYfwEvdpx4AEpIhFig2Vtf7LXiTSXbcUZHFtQHj2OY3eD+
 GjcTZRsvcj4dhwfyhrXYaycC4rb3nWIZyG29S5PDHTulS7vAxIRRBqK4s8rJ3/Yog6cC
 60Lw==
X-Gm-Message-State: AFq9FYK9vDhjwb0Ic95Je5cRnJmqzcc7t+6aAJilk05HP8E+w6wWeGEk
 Gc9hWL+SfSz94f0OXpPgG90JifaEzV6EWwEW6y4Mbo8LeU/0sI3h/nFVnoiyac8/5FYHgqDlFqw
 1Bu5opBscXKNbr0cCyA9sRzI8bIGDSbIgJBErS0/tGpfgNClgVSlY7DIoYw==
X-Gm-Gg: AYBFou3RfjNThZYC+cEXNH7JDSLoQBx+59ewFzT3I/l66quuetisJTdu0QzExIL3PUR
 9gVXIGgMVkib6LpFAqA4DViczNHxRJHxk+ZDf9vTIE0rkZuaEmBtFB/jV4lP9zn/rnKiwasCed6
 JtX5FeamuKxUnyu1kIh+wQ85idn8p+hhf0n8HEJasPUHHcmUaRpww115w7E9PJHKmpsLs8AGvDn
 XN0zyeISBvssjWWTWkmrKAKe4l0mFPA6ITiwSg8/uwXSl4FVCOebop0Boq36YNq4mPyKHPkrbmV
 Y9bmWmCB71jyYfpXdui3IllEmIXso+oV3sjPuNn4nQvHbXWE3ltnge82M21IsKT3mxWEwvFqRo3
 N9ZukhumAmoduxFx05LbI0e1zQ21Or45EXdb5VzLW8OWy+VMWJDoTm1bBieGAWWBm327ZDg==
X-Received: by 2002:a05:693c:66cc:20b0:34b:ee3a:10af with SMTP id
 5a478bee46e88-34f14f2df95mr727600eec.4.1790892641356; 
 Thu, 01 Oct 2026 15:10:41 -0700 (PDT)
X-Received: by 2002:a05:693c:66cc:20b0:34b:ee3a:10af with SMTP id
 5a478bee46e88-34f14f2df95mr727576eec.4.1790892640681; 
 Thu, 01 Oct 2026 15:10:40 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f65202sm1521702eec.11.2026.10.01.15.10.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:10:40 -0700 (PDT)
Message-ID: <9037243f-5a8e-44ea-bc21-5a69a89a2510@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:10:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/18] target/riscv: Runtime CPU registration
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-6-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-6-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX3o781SiGNzMt
 LENe3271/NREzd26gUVQ/HCORJv3Xl7AyVWVlqHGfNnMZXGhxRDM4BlKUaKceiDExYPR5t2kVAO
 5gwD6n+fJPij3Z2YWc+TqE+9QjqRgNg=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abeda62 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VTu0sFp2lcWg-p98E9cA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX/Re4vxysldj5
 lTwwnszrbXRpx2MZHu17PSqSoHoog3Tl8mRKTij5EPMXLlUMfl7ZYtlcIo6tA/sjrwweB7axkbh
 vGs1UxHCX/6Qqm04hBcRMyenGYUlJFjbcvX02rCxirpu9qPSQnXa2tWOLkocyA3GVEMOXrUSVdZ
 KCjboJkBldnRwz+/eJOR9H4cMU7bHtp9D6s6wbmbtDR0lNvZdhAy0OEZw4QShKLOs2ZHdcMLKMA
 uWpY9jrwu2XqVNsHqeZoLkRNT/VilyTHXq6oQVGOs4T70QtpXWfjZn1EYqyOamqzEz99Nm0yW42
 rAnAf3VUDwknIT5QQtd7m7H0MgVJWJurzG7n7x8Q08BZnYHSeab6Kwf+YjmmPaX86z3wmoFCgx9
 uPpZi9rK51bxjdf4pjn0P0ficQkpnYBCVRyze+US/QLzReidj/D3YhnZ1r7PaXOWdjkziHvb8Vk
 voE+NB+pSYsQdtC6zaw==
X-Proofpoint-ORIG-GUID: 9JOe_ooA7i2VBhBLuwnsFlal3X8mBVqp
X-Proofpoint-GUID: 9JOe_ooA7i2VBhBLuwnsFlal3X8mBVqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010088
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=pierrick.bouvier@oss.qualcomm.com;
 helo=mx0a-0031df01.pphosted.com
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
> Uses TypeInfo::is_available to determine what CPUs to register,
> convenience macros are modified slightly to make this conversion
> more ergonomic.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/cpu.c | 156 +++++++++++++++++++++++++++++++++--------------------
>  1 file changed, 97 insertions(+), 59 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

