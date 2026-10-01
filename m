Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97982CA5FCE
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:14:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP2p-0005gM-Ad; Thu, 01 Oct 2026 18:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP2j-0005e3-SC
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:14:21 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP2i-0003KR-Gi
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:14:21 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FtBr63355914
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 L4cEwcAbgRkEYvzS5KiPxXyS/YuZeTWyphRRSrHgm0Q=; b=Wy36h+jB6i0cvnrs
 3am05ABR/wN/i02Rkb3FfMrf16t2hIuJgSO4KCkr7QclMLA8Zmm2Fe45WBUpDHAH
 b1J4AOWKvnERdZQdVRlZBxjp3bU7NEnUtpX3rHe5+ZGX7qJD/z8+mhNYufUJvGtL
 V4ttN9CfzxaF5RGsv0SS2SuOny7VSUzTlTymWcq4NCSEnaFVNf09jxopul+JAz/c
 5iEtR5uzlrwh/1Aem22+NqbmQwdJtXkXoMtjMnaXVzaz8xXDa/G0QfCRH1nnwZFS
 09F+gD5GQkPWno7xhhjjP39F8Eovaw4UJaz7kmO6Em5yCYGmBRNg5lHnTpAoFUdO
 xwIl0w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com
 [74.125.82.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nv937-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:14:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id
 5a478bee46e88-34d84114044so6274993eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892858; x=1791497658; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=L4cEwcAbgRkEYvzS5KiPxXyS/YuZeTWyphRRSrHgm0Q=;
 b=KEGjOLSO8CTkTH+bdAtn8gjeDUoo8DbZbbGcOd10OBrqWGgQL1Bgm4gSR7mR4MYydh
 uLrPpo0GE6OG6pw8GPhJimMNjoOD7MWJUjA38qVNEuBJK+jSCPx+dYESg7V20uzzYb0k
 zcokXHqrWkrva7asQrne89qkrqG+vqNDdeKZ0BuBfoTo1tSIZg4f8k4ed8qTGH7rncFg
 6o5nIQZvbrKR2jgVCBEe2QSbYukP38YFFkQuECYJ+QdCpA2TYTHnNlbnUx92Y8q3us36
 ADRFNJKmf+hvHePEE6ybkLb06glSkzkNg/kcOqm4ph91NZb9hYOo4YGsAiGzQc8q/3Ma
 4bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892858; x=1791497658;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=L4cEwcAbgRkEYvzS5KiPxXyS/YuZeTWyphRRSrHgm0Q=;
 b=yJdp+Inzen+sBCjjPiYbNmh2bQUbQXxx2/7lklcwmQL9QQWcDhUjq3GWgzOptbExoA
 cfhdgM4d3c+lvG9XBE0+vHTF+Z50jBZfVjSIG/yG6ZvTGLlfieE/pAGRI07zvPJhT6v2
 kxhyIHg3yBz91R2bYMtLQ+v/sVszLao0/N4ZFd3pxw/xq0LXzx/Y9UaDfBPOYOdQynkw
 buQ+nwKcEh/Fr57mas4AY7TVZ//aFPWhz/BR1Mf7PzVB+p8m1ZCsNh6yoTxBPEkwUZXF
 11j48bd8vtFHx9aNr2LaQAtT0qHTIujKu5spqdFeGp9u7Vg8RIpcfOY+OibpKUteMj7K
 KdZA==
X-Gm-Message-State: AFq9FYL6zML7T2eWScurk08OMRSe+utMyff4WXj2Oq0pXyjJ4pXElp5u
 BDnUyWkmJWaFGorTz0KTGmkq8AXWzKud43P0C2GX17LzPaiMWSVB/dsvjvqQkETU38ADrRsyp19
 c7XA5tQFfplEZKxhZqFQnz5wjVuIanHIch//Cn/p+HWYGdbgziu7KJZ65Ww==
X-Gm-Gg: AYBFou1TDOO8mv8T1+KIqe+VeS0zgQFeVECyyd6CGofWE/9vOXM7Z1InOt8iWcnNfJw
 VioYBmOxAGOKf8WUb91m0g3F/a4+HWQw+h/w22sgxXdbMEvgJcKHBLAb9Sf6BSXoJOtHgY4hbN5
 ju+cF6n7vP1NR22aJfNhL64frm8CnewYi9oLQut6ufJ6BaykhPzRy8ICUQ5/vWK9dY3xjlp0JRs
 Ym2CLD/rj9Fr/ryUaGxH+WoT7cmv43Zy/rSZoOC02J++5/SY/7Fba9XQybKYzWTffbrkXw0rKqj
 FhXyrB/w1DISJibF06njFNBItMmsmObrZIkmoEzCwv+5NmJbJsx33v4/q2HTYh2RA6Qd6BLlG8P
 HabLf6ov3dOfS8QprwKC7QkWdEd3Ilf2KWXHu46P+d1xOLKjsBki3ORWDH9JCQ9wd2DCFsw==
X-Received: by 2002:a05:7301:424a:b0:34b:55a2:2664 with SMTP id
 5a478bee46e88-34f2199c104mr716286eec.37.1790892857457; 
 Thu, 01 Oct 2026 15:14:17 -0700 (PDT)
X-Received: by 2002:a05:7301:424a:b0:34b:55a2:2664 with SMTP id
 5a478bee46e88-34f2199c104mr716268eec.37.1790892856919; 
 Thu, 01 Oct 2026 15:14:16 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f15019999sm998535eec.29.2026.10.01.15.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:14:16 -0700 (PDT)
Message-ID: <3d44953f-d6cf-41c7-afe8-47baeb216618@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:14:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/18] target/riscv: Compile monitor.c once
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-18-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-18-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abedb3a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hqIjwPR-xFVZAAzXJWoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX2/ZDoxAPCC1t
 dF178pZKeIhC+7lLbFSQ4f7CxXqC/N7OSV+6W/NknAieARW1nOKmuARDGYrpXmVSnpbr3MQROf7
 FP2/6t/kH6UPS1RbyWOM5U0mcVlHwrg=
X-Proofpoint-ORIG-GUID: cUxJWoH-8c0aOqnyHxNO7AbQo_2tQdRL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX3L4rfB+UuLjh
 wXolWhdMSv0+DFyHx+QScZ2P32lLUAZuDuYxfvXFHpKoG4Ita+qFuch0eoCEFsUO0YM6NZm5mX5
 SOidM4HzF7bZDIzvaUVWIvEB89rS2BmpR/B6ejNS7yy8p1AjGSE08Lx6xiaciWktTUwpxPzEFRp
 4opTSBWDpZhRElnsLA2W8a4M85W5mNEQoGaOESslUnGy8hflJm0IrWvAlV539+oICR9sAnI6eNK
 8HUY0ir2uWvSKgYG/e5ehHLKdo7ap5VU1KMTyHbfvpwG5tkDNv8bZQ3hYRAplUmFtuz3TqpTfDf
 ex0RyIvFPuT0kHAr8ZVZpfWpuYw1fBv+lGyRAMJc99mJqtZzVH5KI0TrKQTJhiPDleXCKiGDrv6
 OKvZ8xxZrhfzL/wwgc8MdVKRiZE2MJQsOEhZ6OQFqrEzPL3O+Hkuri+/+9HqB+UfOgWXOhFCJxl
 LgPPSkI2LWpKuPf3Yyw==
X-Proofpoint-GUID: cUxJWoH-8c0aOqnyHxNO7AbQo_2tQdRL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
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

On 10/1/2026 8:59 AM, Anton Johansson via qemu development wrote:
> Replaces uses of target_ulong with vaddr/hwaddr/uint64_t where
> appropriate.
> 
> Note: This commit will print all addresses as 64-bit values, even for a
> 32-bit target. If breaking this interface is not an option we can
> instead opt for more runtime branching, as done by Joel Stanley
> in commit 409c7d8682a.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/monitor.c   | 42 ++++++++++++++++++------------------------
>  target/riscv/meson.build |  2 +-
>  2 files changed, 19 insertions(+), 25 deletions(-)
> 

I can survive to the change for hmp, let's see if someone has a problem
with it.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>


