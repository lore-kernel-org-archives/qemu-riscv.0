Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CFEC79F82
	for <qemu-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:37:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1x3qNj-0004n3-BL; Tue, 08 Sep 2026 03:36:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qNg-0004mY-1d
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:36:36 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunil.laxminarasimha@oss.qualcomm.com>)
 id 1x3qNe-0000NS-K2
 for qemu-riscv@nongnu.org; Tue, 08 Sep 2026 03:36:35 -0400
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6886Lq5f2502437
 for <qemu-riscv@nongnu.org>; Tue, 8 Sep 2026 07:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=kbCriSpLgERKkHaU+yFAALyqSYyuhbB5huelH1UtSX0=; b=DD
 h0vegffNPjypr1mnIVLL7nBoO5fyjibYZoDBITmjjjKUOTvOpT0X2doAiRsr9JS9
 1I0MYzsh9SdV23etSKUe53NRn77kDxWm+VK73z/iScCfYW2keyeR103o40LBZ8ke
 MgFb7C/06/DWdFtfbN01jAxpl9xZXYpEFX1nm31bAbDjxttHgm+xor3VSOr3XSSJ
 cSmhzYnstOnrlUwRFtJGCJf97as7IgGfYqntoM92EKLlWcleik9JhGxGBgXRL0w5
 pfs4fQkO3WZvR9EB1pNLtISAqBZ7ExabTWskJ7FcwqHbaTd+FjRUmtLgnrNBLypg
 dvZaVrH14anRJKQQZr1g==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcv7gbyr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 07:36:32 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id
 956f58d0204a3-66e5572b7e0so715153d50.1
 for <qemu-riscv@nongnu.org>; Tue, 08 Sep 2026 00:36:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788852992; cv=none;
 d=google.com; s=arc-20260327;
 b=EaaVdO2ygf0olDkswCAq3dn4Xqb0ZKgFgwdK7S+3ZIlOw1FwSS8JilxPYR6cgLc6AI
 cfgXxitd201imvCLO8WEFZAZCTetJywELE8VaVLBU1pTZHFmtA6BvSuKs7sPjSlBJXDq
 cvbu5XM3G7DRsHhrWbMsAkK7FHaixqKBCdeN+aHmL+bEz6vekdsPCplaeC2fMoSoBq1L
 iRxINu4L5IGnh2nV856HNwVC5/JZD+xta3/nX9byTE9qY7rDxkE500+CyNLPCIoZqJDG
 BbgmjNSrOPfUtCRJc603vt9gGef8bURlIL5hmq7Glxo596ig0HSW7iRqXxDndzfv0dI7
 MVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=kbCriSpLgERKkHaU+yFAALyqSYyuhbB5huelH1UtSX0=;
 fh=rtpFMYnbJLlAtLQpBQ2Xm4lM+Us9oFtqC8O8JPa1b24=;
 b=DrpC7meYjPNeNPBikzEsgVRBTnomxtaOG2870UroK6tnz3Bw6/pETIs99Cx3pNPy9K
 nz41/da0hmccaNFvQlIYdI3/JpsQzzle4iVo8mlEK84y6FJ3VOBG69tWAWZXmdoN0MRQ
 tlLouXzMar8VL33gS5EOf7DyWa1verXGVK+PbhgKjEtUc9rBf8XpO5bwDxkK1v4YrhJC
 Vwe5ksrO8+IrgF6fxqrcPLdYPQjI5VudaGFcKkHC32hx+CylLF1Nb/nDPoTAztmpksKA
 6eJlm96uoNDrOPkhUtkwCk/kl7mbQN6he3jbYcKhpdSLqOHDZzGXvhb4RPXbC9SPWq20
 NrIw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1788852992; x=1789457792; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=kbCriSpLgERKkHaU+yFAALyqSYyuhbB5huelH1UtSX0=;
 b=U5fVKaN/k2h/NPNBngYh8AdAnRxyCVa7EjMoqmem2emR+8VYSQlhyONy0mXH2eVu6J
 eU9vlxS1RJICTqiKDXNb41XDumPPcyqoC+YwEON2ki/zTxyhutnh+1a+aCp+0zLv1FCN
 mTU2baPqEHlBpjsEu+Ir+tkLqUXiY4aSbYM42pZMwkhc1oGGwHykXdo3uY2Em+zPFh76
 i4WCSgbxkg7IgKxTfCOZrUEp7Bf2KW5bX/ArC/ZgbtD7oPWsOmPEQnOuiJDxVEKtVMi4
 9fgUfWuGxm48rd53TWNAFx/6sOi3TEtzyUsCsmvfzZcp2Ld4wmvUvMjEViCDDV0E9Mbq
 h5fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788852992; x=1789457792;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=kbCriSpLgERKkHaU+yFAALyqSYyuhbB5huelH1UtSX0=;
 b=jLYmIP8zATPMJ/cxQle0ZFnk2bPWQ00Ec14ZXubNwWWZX1AJ8RW8fTMN4NOajGck0t
 4QcZwI8VSSy+rE5L1T80y1ApXGxLD4PS+thNDc+PjjwoR+3pQjvfAgxR3qBFuseuomFM
 tPyS6SZj9vViXC2z4VpIA3yS4pMJk2Z8JrWWnPjcDYsPBTFA7mF06lBrvk6M9HZYaHqb
 c4q4ggOxIT7jyKVOJ+nO2zw082Uw5VNdnEtUZGp6tNfnEKDAEeFaAxt/aRz9eSIX5s5m
 ycdS3D+RzhcHz6i5zvqy11X7B9cerihvmFJhLt0oZtDnH33hCBlISTT9Lf+i+AJSY8VW
 T3NA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxdcgZDPPxdRZpDuiiw3QvXA+lY1qLYHl7NX3t17tu8hNauOkSqRm4E/FTsDGEZbn+/M879p24BTb6O@nongnu.org
X-Gm-Message-State: AFuF++nhVZw2MQZmxFcoMMF2Y2Sc5JQvsujlFAC+ntJMBr12tEWC1Doq
 cV5QRLEtvcxDg3r/jcGMiHX6dAm4tpLD1XB0PgGQCpT/ZUHIyv5JjE5XQB7IHBdWZOHU6rENlUx
 x2qJKRxZ4b2s+OpiCU3sDVAVP0SL1XVjAOCwgCdZg698X/lbKQdovQIPVXTbfz4kAuMOVj1QmFs
 sPn3GaWgDbl6BUZSIdgR9f0O16BSCtttOa
X-Gm-Gg: AYBFou15sD5WygRId0rAjpjJ7e32PZmvljaQOoT9YgH2RdOZ7/kbH883r/H+yhMglfI
 oiQgBBMXuOKVewOacM2QjEbYbhQNp/uDapT1VgdRRjMm/TsSElaJNmGUcFjV3oWHcwf02Fk0/88
 EVN51zDEC0ekOOyRcCjanm9EeUB7M4s+WFQrDddIvJDEoj1p2fKXwJPu325oE=
X-Received: by 2002:a05:690e:1306:b0:66f:8a2b:b693 with SMTP id
 956f58d0204a3-670f493e1ebmr946452d50.17.1788852992505; 
 Tue, 08 Sep 2026 00:36:32 -0700 (PDT)
X-Received: by 2002:a05:690e:1306:b0:66f:8a2b:b693 with SMTP id
 956f58d0204a3-670f493e1ebmr946443d50.17.1788852992150; Tue, 08 Sep 2026
 00:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260828112803.86636-1-subrahmanya.lingappa@oss.qualcomm.com>
 <20260828112803.86636-2-subrahmanya.lingappa@oss.qualcomm.com>
In-Reply-To: <20260828112803.86636-2-subrahmanya.lingappa@oss.qualcomm.com>
From: Sunil V L <sunilvl@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:06:20 +0530
X-Gm-Features: AcwNN1XKZbNARl6HP-wKvI-4_Cmb74eIeZa_mNiJTxROv49L27PAf4OYpDXrYeU
Message-ID: <CAB19ukFa3mUc7LuWMuJHFwTYs+7o-bp5Jdpk2gjQVBa1VDKGNQ@mail.gmail.com>
Subject: Re: [PATCH v10 01/10] build: add optional librpmi dependency
To: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=CMEamxrD c=1 sm=1 tr=0 ts=6a9fbb00 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=8rMF-3-UOXLQO1KvhcIA:9
 a=QEXdDO2ut3YA:10 a=0lgtpPvCYYIA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX1nXw4xtTBTpO
 0Ebl3xaPR0Lw13DlHPBsH9aknFwYL+KKAvIKVNEV7+IdDT9AGqKb4eNp+mv7IjvSo5sOCcvNuFJ
 P1sXHVMOmzUkj9KBp5+XKsCS33bGbtQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA3OCBTYWx0ZWRfX8/3ZiCZ83g8H
 Juyvol/l6hxhBV474+8pOm7+LJeNV1Xcsbq/FmVL34b11a9+Li6e/pVt5rGkr5DQ3Xiq4kI0bPp
 5nPUBzqCZoFMjOl+9Xg3Dg1XLrmlbvCyfphnltYx1rUBd8GPwyMPiSwoKCHr4bl8MWSP/1yasYD
 KHHIdFj4b4naYmQrzlLO0IFXbwEMXTKwsSer3nwd758nikQbXI1cPMm8xjciajF8mdpLcKyiwX1
 odDUbUxXbPrZVpcHkgj6lsig1Qu0IOBQwl2bakp3fbnWouhpCzfrRCwx3ckfgKeYR2AijTCiYw7
 7WY3+pCja00FYEtNZ35QNDVVaY+2R5WVN90qFTRlZlBnWstlt7W0cvY4tHe3AyvSRF0wnp9slZp
 7F5VGMK7YyZzXfI4RJYtZT/6DnQQ44+X9TSxGNStzW+ou1r5Id12BuCRkXhEIeEp9sW3yQv3Xqi
 wjUN4rdkP6Tzjn98/Dg==
X-Proofpoint-ORIG-GUID: lXLBU0f7-2yRvHlns6LGuvlFVwL1lcYH
X-Proofpoint-GUID: lXLBU0f7-2yRvHlns6LGuvlFVwL1lcYH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080078
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=sunil.laxminarasimha@oss.qualcomm.com;
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
Reply-To: sunilvl@oss.qualcomm.com
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Fri, Aug 28, 2026 at 4:59=E2=80=AFPM Subrahmanya Lingappa
<subrahmanya.lingappa@oss.qualcomm.com> wrote:
>
> Add a meson option and config probe for librpmi so RISC-V machines can
> opt into RPMI support when the library is available. Keep the dependency
> optional so default builds without librpmi continue to work.
>
> Signed-off-by: Subrahmanya Lingappa <subrahmanya.lingappa@oss.qualcomm.co=
m>
> Reviewed-by: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  Kconfig.host                  |  3 +++
>  meson.build                   | 14 ++++++++++++++
>  meson_options.txt             |  2 ++
>  scripts/meson-buildoptions.sh |  3 +++
>  4 files changed, 22 insertions(+)
>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>

