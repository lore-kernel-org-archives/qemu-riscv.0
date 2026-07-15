Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7863C44508
	for <qemu-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 15:35:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wk1dz-00024m-26; Wed, 15 Jul 2026 11:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wk1dx-00021a-DS
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 11:35:29 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@oss.qualcomm.com>)
 id 1wk1dv-0002gG-Lq
 for qemu-riscv@nongnu.org; Wed, 15 Jul 2026 11:35:29 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66FE3cd83806280
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 15:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oKEB1Wrf8QZ/8qZnB/Ugfln+7EFgQZLto9Ix7VF2P+8=; b=MVAF0BxWgNvhfOsU
 dIcEOeTDIFRPCAIGuyD8afUbVX/h4v2CyU2CXMl9EfbZHQTAci94lQ2Fea5nbuMl
 3uLI2R5wlt2oIFO+79lvLxwY4HyCPS9H6Mxogz2OMSbuPG/c2Om8tvI0fV1k7sTF
 VBs8cajv30hkHdIgxPPBE76zHz6Vnhy34DDIugqEfR7W4XJPl0fzoAuc0AmO0SFs
 fvUvddzl3uCZ/3+ad0qzCS4MPWHEeKWMTnghgv4CPj7p2/bptBwUg86/eZwZj4nn
 a/lrwy56ZXiYGfWLW9ETV4d4ec8Fbai6qoKbPMlmx1cEYYumL8hj6nCbaBpP5g9F
 YrhFOA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe56ha3wr-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 15:35:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-c894391f000so4990574a12.1
 for <qemu-riscv@nongnu.org>; Wed, 15 Jul 2026 08:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1784129723; x=1784734523; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=oKEB1Wrf8QZ/8qZnB/Ugfln+7EFgQZLto9Ix7VF2P+8=;
 b=IDcEgUHEn9zmz3xE0UDV9yHzDunknC9MVIGWmEgUiPzVstfeR6vCDrBNw5vNKJuKrS
 K/KHJbxAgyWYmzunssLApW8odlE71hhIRWPuoOrgF4RERdA5RJPphBp5DxFiTGHkID1Z
 XJ/YlZpCXmS18v9MGdi6/r/Mfe0+csFbtErtDEKF4qxAXid9+kV84qv5Te69K9bpMxKz
 P8RoerVok93jh1XZ4rH4EKdtTY/dIs1W0l4WHFV1RIusnc/K8ThWyi6UhmpJNEdAijA2
 t4FMlPRLv/kIpTrxmxgA3Y04C7uTVWjI96HEAkaL7otPgLJCTcCrJ0Wpu82Dg/i0Pant
 NsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784129723; x=1784734523;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oKEB1Wrf8QZ/8qZnB/Ugfln+7EFgQZLto9Ix7VF2P+8=;
 b=FrTgXXSdMkNNinB04zRpiUX7JapaSnrLSD7tAoZ9UZmIWSo4F2eVAbO+SjYrzLxxI0
 QnQN9N+u7CfmqwhEbqxP9n4g1DpXPGBWTXV8yvvGCtcv/BuLoSpzsei4sMUOBTBRnYLL
 KDVZvPymCTW65Cdrh0qCPKaC/bGUcfjKHivrpKGjz1g52a8qIWIfOqSEY5LQJK9KtWYV
 wpOXZOdh81ts1z7qBaN9/fXLfqjDCdi+xOy+1osqwrki21IFPHuYPSyxhViEqswUvImN
 3SDd14kd9KYesp/ezW/iv6Cx1kSa97mbTtDV0srJBopygPfdtIvjMhFfSvfUswjxLlLP
 ojWw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrVmQGuJOgXVDS39MNojccBAXEBYoTBp8Z4HvdUZjxNN8h5Z0e95froe8oI+KN2IJitB9mBT+6nVBHJ@nongnu.org
X-Gm-Message-State: AOJu0Yzx+SckzF96gc333wIqZ/Pfwv7SkUCYqi8yTKENAS5+tjTmFrFp
 l6R0SWnDsDgBXBDGnDN6tBDHvvB+wZxxehL77b95XxnM2plR+Kc1500bA9pZE2y730QVzljwXEQ
 XJ+vRVU5e4KvC2FM0JDQ0D6+8iN49m0u2Wsn55q77BDn20WYF/IUGq78tew==
X-Gm-Gg: AfdE7clQHd+aMXRWCZzyzvHN+XstXm7TRddgIKobuXknrkBn/XmhQ7hCOSjgADAiR1o
 BgOraH9HnbgmpsujojQ8zIbClomJBKAbAS4KlcflMlNDJv7wZWW0GNmLuxhgdHgkTzPMEs05mrM
 y3NYEmz+OP5lhpUMJJcahYiH35lJ1NK6BxM3CZFe2HuX9PWsb0rVGViagT7ZCpVH9sdW3JnYibn
 fgiM+oO+lwKGLfOAbJ5HyptTDwqaOpeP45wbVY72Xw4/rcyY63d+isdrRtQ4yAQ61c41e/totep
 sEKcaPudA9BiB2R2YKrGjqzpTIrLny3LuS9ki7EIXjA/OH8e6IYWFpFEp1grge97mvDbrkfoLtX
 VGIPYqSkSLeAWldm7DcUUJeinSxnD6z4wzlC1lngDOJNSpdmY74zr7BYjNiPQL4OUD4UkKiopP4
 bEZ/o=
X-Received: by 2002:a05:6a21:6b17:b0:3b3:241f:66c4 with SMTP id
 adf61e73a8af0-3c11018d946mr19796926637.28.1784129723204; 
 Wed, 15 Jul 2026 08:35:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b17:b0:3b3:241f:66c4 with SMTP id
 adf61e73a8af0-3c11018d946mr19796886637.28.1784129722622; 
 Wed, 15 Jul 2026 08:35:22 -0700 (PDT)
Received: from [192.168.1.170] (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-13cd426ad8csm2277953c88.3.2026.07.15.08.35.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jul 2026 08:35:21 -0700 (PDT)
Message-ID: <3c7ca00e-a78f-46fc-bf29-bee2cb3fdef4@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 08:35:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] uftrace: riscv privilege level
To: Yanfeng Liu <yfliu2008@qq.com>, qemu-riscv@nongnu.org
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, erdnaxe@crans.org
References: <tencent_E17E8F6494EE130F71527C6BCE481AF33E08@qq.com>
From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <tencent_E17E8F6494EE130F71527C6BCE481AF33E08@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDE1NSBTYWx0ZWRfXwBAG/GWtTmH0
 TZZx8GD6JrGSgH78fuYsgkGc83A7SqU+EevLNqyGTYaD0uU7I0uCMGWWrLm7MtsAWo0xeQM7bON
 j/e3KpWsMJiSX0nEdFGgFfUP/Mbhob4=
X-Proofpoint-ORIG-GUID: BDpgbYKW8LmBmZlmoFTByyRGIC6qfrw1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDE1NSBTYWx0ZWRfX8TWZZp1iHQB1
 1wE9jgJK/BgAZbSgf8JQWRlb5oWJcyUVcRzbFzwus9RkxJqq75PIr3vNK6IaKQfe0fOVNOBYQul
 ym/miPeCWxAx6Yr9t4zoMssnE22HXtY0yWY1Km1hIkifxnsZMDVp5js/xlPiIU0kuFp6gT4mqBu
 sLHA9bjOuwmKcNnIiZ59j2G3Eeo8Yz9bUO34JodZkGUhiTE5bFYwrqRtEAcDKTBbSTGWnBHe874
 89d1hD4DxPMoiIjIxPUPttlxaGmfNfx/28WJo6uo67JGdsOYY2TfVOaTL/1kLMuGubDKRlDDySW
 tyrZREc3NOdckqVB2sRbZxPGhthBYbL71eP3E3IdmIZlrRodpAfQMmTbBYdbNU93i/VQynpzjLZ
 FXUMrWXFlb/H5zNtLtfGGf9pQ+q7uV2RSwDpI7p4FbhD+8vd6nycukUZCyVOoEX6BUcTZlVwPko
 4OCdvaCi3UtVjXZWBBg==
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a57a8bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=iLqgmErQAxjCjdq5jj1Aqg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=dZbOZ2KzAAAA:8 a=2EAK0dWcFSsNEvSIV9MA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: BDpgbYKW8LmBmZlmoFTByyRGIC6qfrw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150155
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

On 7/12/2026 1:45 AM, Yanfeng Liu wrote:
> This adds RiscV virtual user and supervisor privilege levels to
> uftrace plugin to avoid crashing with H extension guests.
> 
> Signed-off-by: Yanfeng Liu <yfliu2008@qq.com>
> ---
>  contrib/plugins/uftrace.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/contrib/plugins/uftrace.c b/contrib/plugins/uftrace.c
> index 9b0a4963ae..063e32220b 100644
> --- a/contrib/plugins/uftrace.c
> +++ b/contrib/plugins/uftrace.c
> @@ -109,6 +109,8 @@ typedef enum {
>      RISCV64_SUPERVISOR,
>      RISCV64_RESERVED,
>      RISCV64_MACHINE,
> +    RISCV64_VUSER,
> +    RISCV64_VSUPERVISOR,
>      RISCV64_PRIVILEGE_LEVEL_MAX,
>  } Riscv64PrivilegeLevel;
>  
> @@ -153,8 +155,10 @@ static void uftrace_write_map(bool system_emulation)
>      const char *path = "./uftrace.data/sid-0.map";
>  
>      if (system_emulation && access(path, F_OK) == 0) {
> -        /* do not erase existing map in system emulation, as a custom one might
> -         * already have been generated by uftrace_symbols.py */
> +        /*
> +         * do not erase existing map in system emulation, as a custom one might
> +         * already have been generated by uftrace_symbols.py
> +         */
>          return;
>      }
>  
> @@ -706,6 +710,8 @@ static const char *riscv64_get_privilege_level_name(uint8_t pl)
>      case RISCV64_SUPERVISOR: return "Supervisor";
>      case RISCV64_RESERVED: return "Unknown";
>      case RISCV64_MACHINE: return "Machine";
> +    case RISCV64_VUSER: return "VUser";
> +    case RISCV64_VSUPERVISOR: return "VSupervisor";
>      default:
>          g_assert_not_reached();
>      }
> @@ -986,7 +992,8 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
>  
>      score = qemu_plugin_scoreboard_new(sizeof(Cpu));
>      qemu_plugin_register_vcpu_init_cb(id, vcpu_init, NULL);
> -    qemu_plugin_register_atexit_cb(id, at_exit, (void *) info->system_emulation);
> +    qemu_plugin_register_atexit_cb(id, at_exit,
> +                                   (void *) info->system_emulation);
>      qemu_plugin_register_vcpu_tb_trans_cb(id, vcpu_tb_trans, NULL);
>  
>      return 0;

This was merged into master (c149f7b367fe85edd1c438ecfd876f0c80a6ab11).
Thank you for your contribution!

Regards,
Pierrick

