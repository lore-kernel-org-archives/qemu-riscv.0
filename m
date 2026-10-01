Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92241CA5FDD
	for <qemu-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 22:12:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1xCP19-0003Ri-3D; Thu, 01 Oct 2026 18:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP12-0003L0-KI
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:12:37 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1xCP10-0003Dy-W5
 for qemu-riscv@nongnu.org; Thu, 01 Oct 2026 18:12:36 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 691FsgO42687100
 for <qemu-riscv@nongnu.org>; Thu, 1 Oct 2026 22:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JN5UP3/Y0Edzbm8KIUD11LysXxLArl+eUm/T13c0Q6k=; b=n6cH/SVutZTXkkLC
 GxUBbsQitF7mQe29dd5wSSYgrX7xUsP6ZL+xvDxsR6RNcs5V5uhfREyjchpPMn9T
 /1DxUu+wTfEznMyeNPEceAJssnOxiJOEp7r9i6fiM426TJZwEtZdPUnCmIxPh5Wu
 BetRtOtcTnVr7E2iLSonI1zKY7BTgi52MyuJSho4bRE5acphsPAukdhcSB9nZakp
 5W9EQJoYAzY5bLNdrAq0aHPxgUpFVaOTD3wJucSvt1B94MoPILXNpXMyNlfJKQP4
 Hg2SEXGdTQfo2S1jHX7CRs2kRWbuGp4Q9yVxftRkEHhMgjhJ7TQD0SF7qEvnA7LP
 rDOzlQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com
 [74.125.82.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1t9a9mdf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 22:12:33 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id
 5a478bee46e88-30c0d568830so13612433eec.1
 for <qemu-riscv@nongnu.org>; Thu, 01 Oct 2026 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1790892752; x=1791497552; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JN5UP3/Y0Edzbm8KIUD11LysXxLArl+eUm/T13c0Q6k=;
 b=FxDWSk7/fUl7tvYX5Em4rYPpwza47aycPuG2we6HGzyLztnd2D81SsP8Nj1LAQ+Q7a
 cUOn7N0ZAyV4erqVdquGyocpQWdwvz6SmI4Eo7B6vhLJmvGQf/ls0pnPdy0S68wOVzcU
 8YdgrWDSL4WW7LInOynfQis5e5cFafQ5PdImAsxAhACHSrlyUYFG40v03W1wjVAfpnjs
 3fod2akNZ7qAwValP/U41jkyyc1D6tUGmonUx6nwQy/Sf3VyvurVZUw5KxM4LCZYt8gF
 TC60fh5XQnok0ytzqpSvXQA9d3fSGvuqwoNrrgRccl2UA78KEa9/2maaNsImOqRk2txt
 R6hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790892752; x=1791497552;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JN5UP3/Y0Edzbm8KIUD11LysXxLArl+eUm/T13c0Q6k=;
 b=G7MLt4hHCTZZJhgl8J9xCdmyIXiscbcERcQrTxgjwL1bymYJY9GK79diqqk8XYi4fp
 nyYP/l9CNSIq4m3YYUNX1OO5CJ6Mjahv45zt9A2+O56dfwVE4+ALD64qgiVbRHCWXoFp
 AxCr+gVlqw6lBMsOUWBXInRHhUzlY9E2oM1xStZm54622a4MwokYN05iQ6TRa2YjrmU+
 kPW4WCAcPCJ1FJfg5GjKuFxy+kVpVZQuPuUvjo4HIA7zjP8kzxMZCfuxSzR3V5kNAdAd
 l3meBtj2Cnm7W76QMMVwOPvksEl4iSCxEiMA+6fUA5xru6SHnq33/epYdyeXgMK2B/un
 DdDg==
X-Gm-Message-State: AFq9FYLSR7w9y8cEO6rLO8DLyLj6pMbM3mKobGJIMY5gofTSy0h5F6Nq
 KVAh5hsyQ4EZ/oGLWe3vz/4SLLl3yZaEBTyyxecje83GjJuB1/v9BayFgqsT1wy4rNW1YBXOwbE
 6qCSCQtfHUlqNvIuFE897QNPAAG62HtQ01hl3sYAZF7v4yuC7h3j4u0rx8A==
X-Gm-Gg: AYBFou3pmDXcs6KRL7hGq24750q+qFr909cUbkUkIy7pU9xTtj+L0DVt4ypvsjiguBS
 qbLyJyBtORu0F30sJwycZYsYiolrSPnQO8Dnwy3B2RPrHjAlQACMWmrzhnj9AKio0eVzBRhOb0I
 K4ydYA9kdW7ObCS43qo8SoF9w/p9FM3xdhhFV6paj4bEy3rheTmgZu/joJdH72WUlsIl0wyQ+i7
 V/unnFqOnns04KwW5WKFLlMQEegRTEYzTfc1ye80EYDN+gglrvPHZPxbGz48IpMR6YV886UdJ5N
 9R/yMX8Vz6DiKzH74SWwSsMIXSJTrnjA/VCvecNzCdSRkVBBuW1bNXfAdchjTaBbyX62WoJtX1j
 ZxICFKrplcvZppASUzi3ZEZJvwIctg0tHJ5FvKhKQ2uqAQcusLEavK3XBmyYIu8JwF+2Diw==
X-Received: by 2002:a05:693c:2807:b0:34c:7602:5472 with SMTP id
 5a478bee46e88-34f150d9455mr673593eec.16.1790892752366; 
 Thu, 01 Oct 2026 15:12:32 -0700 (PDT)
X-Received: by 2002:a05:693c:2807:b0:34c:7602:5472 with SMTP id
 5a478bee46e88-34f150d9455mr673573eec.16.1790892751829; 
 Thu, 01 Oct 2026 15:12:31 -0700 (PDT)
Received: from [192.168.1.199] (192-80-163-190.dyn.novuscom.net.
 [192.80.163.190]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-34f14f303e3sm1290619eec.5.2026.10.01.15.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2026 15:12:31 -0700 (PDT)
Message-ID: <2b427580-fbcd-43c9-8670-0950878c6ed9@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 15:12:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/18] target/riscv: Compile pmp.c once
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, daniel.barboza@oss.qualcomm.com,
 philmd@oss.qualcomm.com, palmer@dabbelt.com, alistair.francis@wdc.com
References: <20261001-rv-dedup-v1-0-ea69b07afd31@rev.ng>
 <20261001-rv-dedup-v1-14-ea69b07afd31@rev.ng>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001-rv-dedup-v1-14-ea69b07afd31@rev.ng>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX7JMDC4xjI1aE
 0xJ3yhwJczcACAStR423j9DwB2eD6lEJ+G/5/hkZyNQAv8Zvy0UdNhwh9YspITtmOy390bmjvWL
 Jv2pzVMUYrDHIgo09ZhKJkHR+MVrOQo=
X-Authority-Analysis: v=2.4 cv=N++8hG9B c=1 sm=1 tr=0 ts=6abedad1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9852oil1ID9t5xBSyQ/BEA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fkZp-GEFjr1xpXxCPPcA:9 a=QEXdDO2ut3YA:10 a=VxAk22fqlfwA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: oQKz4BiOsz7hB0oXp1Tw7J0XFWYT6KMQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA4OCBTYWx0ZWRfX54rbUDNp8K0w
 bRd9jCjdf7jCSyuYVpnHq4PzE8R37J6Cs2zXWK1DVD6+yN0tVjMqr/9hEIuJ6PjsPVJC8DlIOir
 PnKKTVkVAX9IR8zdWAfsccH5z29e6pht7jp9CH1aXmBommTwao++HRONiA3LgwB62QSzosaTrz2
 Khcu03dMuWPvcHjwkk+0TUtWi6FW/Z6meWcZy1j61/5lAQ1vY6pMYFym9tTxi3EVw1QelUXclYj
 SGpWn5R55LKiG+ShOf9/nfzZOQN3fXQCSGZw3J4rsVCjRgGaTQ/jGga6OPjmUBfknrF2QOUa8qL
 /fg43YUm9V3RNz9YS4EgHu2nsXlKklZ5Ii/6zIE8ZQ2c0vjHnUIhlWzpFRhWliAjkdEjy9OlIEh
 YNuHZKiflMyBkxPFG8+jWnukmAVdVoFsLjKh6hglyOsdV71mGbFJXKwGTbt33T8uU1Sscv+SHl+
 OgqWZ4TwvawE8cVjycQ==
X-Proofpoint-GUID: oQKz4BiOsz7hB0oXp1Tw7J0XFWYT6KMQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
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

On 10/1/2026 8:59 AM, Anton Johansson wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/riscv/tcg/pmp.c       | 5 +++--
>  target/riscv/tcg/meson.build | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

