Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F45CA5FD2
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:12:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP0j-00031x-KR; Thu, 01 Oct 2026 18:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP0i-0002zm-8a
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:12:16 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP0g-0003DT-OQ
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:12:15 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FsVgp2475296
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KN9lz7E2kBIk7ZyJ9xfIZhdwpERHlQUThvA56rClxxg=; b=e+uBKCJ2yFY66kkK
 WzsSsvd0ZIIgbssEonIOqa0OrUJN3kY+C1AiaG2ft/M83IVXB2EKRpxBhyIQcnP6
 gf8j6vkY5VH3CwVpW2RTJOpTknvrPwZBDItwE0VawP5XPwgb+GgHjz6t6Wye0wwC
 0NLtlFfYV9IIgNR1G0Z0rYQTTar9L8Mt/gGbXoNayxqSi7xK6pa8+Anqct46Tapc
 CvWG5kKyTpE7/a00j9lgAIXwUBTYFoThWIzjeVc9COsC9q/p25UqxYeHi9S8PEZv
 cBSgh9ibIayxsbKjn5nbyBZGLZHWxfITjnUU5pxOUYfj5hIpsBjC5dSj2KV0lfj3
 EBnJMA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1tbg9jh4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:12:13 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-33713e5e6daso9860102eec.0
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892733; x=1791497533; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=KN9lz7E2kBIk7ZyJ9xfIZhdwpERHlQUThvA56rClxxg=;
 b=KZovaO0KTo5daM9e7oLJ/McQm1muAxdNWxNEcJzQ+2dSwUn9gUbOd10u4Y+7UlRdsj
 TpkjUkRwe7t8lcattEhyxdGUWSqphdzmK+eeEYb1kv8AcTPDmvjug2WvWYImflZH5LVR
 I/8ppJ5ncb6Qj0P518bjngq4hdmtjaGITiZ0tT+6i7Jc9aCRVbM8YsWmFzrGgaOrN3Zg
 0M7HTA+yuCAwjj498NnrPA2Ij144fqmpaB2aq8iT3KJeCrDd+pqf2TiX/WJa6tEj8K0W
 Y6M7hPUhr9Mqp+2NsjZP1YucSxhm47A8uDJ9aAYtXo7rZOo05xxtoYNGOWdjrIZOW6rV
 QLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892733; x=1791497533;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KN9lz7E2kBIk7ZyJ9xfIZhdwpERHlQUThvA56rClxxg=;
 b=CDh2VDbtT1YxNqx1La3fLHvs72IBlNuCU+LvZaBp4rab591j4Lvqo0yLPRBjlyy9RJ
 dKIhv1AIF9x/7svpC9wiLXfpMV/tjUslhKbaTvz2BloGXE4EmM8MRVmyjcVx4jLwFGvl
 KIyZmYpYfV+PwLfMnSDA8Eul2cyw5zvEnycO9BytdWNbwULbhC6s1Us+ffjMn16I5tgV
 a2VfplHazANKFE3UNjh0DLIYT1UwmK1qAB239Ld3BoW5Njky3QPQBVZx4qLltblqzkaO
 Q5rc/A5P8WsH/Pbozm31l/utYujzI8G3564PkZg1D4W5Zw4JUU1VlLXglQfP9jSxDVGP
 GCTQ==
X-Gm-Message-State: AFuF++kigiGUAVhui00mRz/ZJfTPMlPCIbdSo6NwzOsTVt0Nj2lnD8+5
 J7WcVhOjR0nf3/qIaq3UB48TJBewGS1N0LXTo021mYra/HwOcfoHdhU6wG6/JKD0ApCAzAJt8Fg
 Hg+Vl23tlzoO3V0ZkoVrblGqqyW11CCl3FDIMurlmHLia1ELMHy64TwQXXw==
X-Gm-Gg: AYBFou32jXraLRMdSZ5o/R1j5MFm7rv6p9c5nq3nny89tMBrQ1jHDucqsUNTa/Vad4a
 V3sW7t/Slfr6ZlFdETDglO2Rxrlwqsfhk/fyAUralPmEamwZcVEplM8Q01lXgSQ2s3ARBZl9QxW
 mBJc3kffEzMq2TABQBLfTPsY+xWoFCjTyrGt+SUTr75I8nKr8TbZbGymb63PoDSwcwC8phPCJp1
 6sgRmRkD7EVM+SbaXNa5emr0oOlMuddv7YvwDdTrixvaU0p/4gnsD3MhFvS1p4lwN4IVy1mniew
 AuBtW+Hmet5EoabFLfgeu03W1ni9ipLO/lDY8jCQD41NQGOuHlEDpieF4W8qV24EdciEMZ61qZk
 m43bFW7sSQokmaEbNtCo9yP3E2+07ZhazMaP5RymA2n/yEy84d0KDExPo7gfYNzdf1JEZIQ==
X-Received: by 2002:a05:7300:10c:b0:34c:df85:8e3e with SMTP id
 5a478bee46e88-34f14f2bbbcmr575778eec.4.1790892732548; 
 Thu, 01 Oct 2026 15:12:12 -0700 (PDT)
X-Received: by 2002:a05:7300:10c:b0:34c:df85:8e3e with SMTP id
 5a478bee46e88-34f14f2bbbcmr575753eec.4.1790892731970; 
 Thu, 01 Oct 2026 15:12:11 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14fd4dd2sm1195237eec.20.2026.10.01.15.12.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:12:11 -0700 (PDT)
Message-ID: <9c1f66d1-faa8-4be8-b1fa-9ed4f039f052@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:12:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/18] target/riscv: Compile riscv-qmp-cmds.c once
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-13-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-13-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX+Tb9cnw9DAvO
 9JNOe7OhuuGaZ61DblOSNQBINX5o65Cv9Ou2rhO16DjNxQKUZsUZPxBg7lLaTV9O+kvKY1peBFv
 7qsjQPx3uIJ1gMmKRb8cCxkzpkiIT38=
X-Authority-Analysis: v=2.4 cv=QY7zLcbv c=1 sm=1 tr=0 ts=6abedabd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dREDruNvXLWMvVqCjPUA:9 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX9+PSKn9XJkHS
 tYzX7COzRiNtCC3bKaAC7NXWGwW9UtWXrYtImIzdxLyBAe+HN9je4FBP0ZLnc8rxj7qcnYsnhQo
 HXGmOmhDSg1UWCpTn53SLn41BtghBt+AMndnc4QPP4w8ow8Lnlh4GMjzVyCL+afkyV4hPXkwrOC
 N/T4wjMZzre+3H58hQ897u7b/YLVSnZME+tRoaditdq9CWw2B5QNeFbbrL96pL6C2QOKAhRAdqs
 R5O0Zh23f4I1cjiTMc0tEu/CDoqOgum1dNg6cw/0gzd1hW/QMzMPXB8KJCTiWNyjEalZC4gMwqG
 G/6JFaUGw9Sy5rwXNpwZwmUmVrh7U3EMQHuDMyG1P2Zodqop6dMjiYcbDHTDhGZ93db3t9Iop4P
 WSSEUHXemop7GRn1RXhZyamtpc6Q1G7zDYY0ZI6qNPBIrm1DlhqcgOVAtMgskkSLFAWXfwtHoe1
 Az/fvudQJro75sGcGcg==
X-Proofpoint-ORIG-GUID: rrXMURu1g8fdJdTdiAJIcLwVnyxR0YqU
X-Proofpoint-GUID: rrXMURu1g8fdJdTdiAJIcLwVnyxR0YqU
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> File is already agnostic to target specifics at this point.
> 
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

