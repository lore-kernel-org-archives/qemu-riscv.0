Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041FDCD8C92
	for <qemu-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 02:57:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1wWQBR-0007v3-EI; Sun, 07 Jun 2026 22:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wWQBP-0007uY-2M
 for qemu-riscv@nongnu.org; Sun, 07 Jun 2026 22:57:47 -0400
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chao.liu.zevorn@gmail.com>)
 id 1wWQBN-0006IZ-Hm
 for qemu-riscv@nongnu.org; Sun, 07 Jun 2026 22:57:46 -0400
Received: by mail-dy1-x1343.google.com with SMTP id
 5a478bee46e88-30759632453so5095219eec.1
 for <qemu-riscv@nongnu.org>; Sun, 07 Jun 2026 19:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780887462; x=1781492262; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F0ybTsXpRtSsOnAJvkaAfgt66zHmzQMMx618/yj4OKw=;
 b=Mkn2PYkOHlqzEbtL941FO/yjd8HP9xfbJIXUXSFGtyd9iOSGZAI7izTF0xWgiRxw1S
 rpXTiEN2xm8AmN1c11z61Hc1w+uLMOPKugNThrZkdmWs9ebR2VZeEkzfb4B6HSerKqX3
 SXal3JUprHQ5rVkdw40pyTwqCFkh5qFc0Ye3BJSwnj4QmtYKMop+ExiWPALGecGWUFIM
 LGFz7PuTZFvPBMqEoyWlaJU3LiVWrwCdTpf6enp/+t6lXLRvGs9q7If2WkROfToezenQ
 Aun41XzVAYbQETm+qiCdkwCP3ecKassX7O4XNrd202SJX4rrXQCwgpV6PSfx0FhNbZab
 3Rbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780887462; x=1781492262;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F0ybTsXpRtSsOnAJvkaAfgt66zHmzQMMx618/yj4OKw=;
 b=Sk55alIgzVHYYRJlDYbNhSbDpUcJPQapbZMPa5bFBXRlLjh4cMNBCb27AA6cOiln9k
 AUYFk+Xb/aci2ecnuPwOGnmLoZwVufNu035chxMqs9wjzz4MHajY5RKSBJx2S6BJtmFl
 ExXX5hn3rUKpdzW8ISVtT5bS8AMNFM+b1wPgo23kZBYrtjEfRz5QV3dCvvsHT1Tu/G5C
 mWGNmb4otySvELLu2ROjqyV//KX2S8HaAtoFv9zWLC7OKr8A4pejlXFya8kE7JuT2OFQ
 EMMMeo/d4NWlpHltWROvfKDPbDr0Lv4ckl7vyurT6UVL33sfRgLaGwKHl+bjdbTk2O4V
 iEvA==
X-Gm-Message-State: AOJu0YwWjQ+Y1k94fftD0yC7E906RKDCCpIZ9whqUFphr47o3vCurLTn
 1NARBxZOd2OzAD9HEJbKMR75VUKHydot4AVcRDY93HNcD4GOFt2wE6wZ
X-Gm-Gg: Acq92OGYBkunkXKsbHZAHZ0LkLXO5oEgtZ8RuNmNP9Z9C4xE83M8CfUL33mddC02EL8
 7EraCUx/ng2R19udzOT++OIH65efgEKNTbqHsmb2HYVgO3qPO4I12+68MKinXfzCoiv0jMsywcs
 PT1J/W35zu26Ga5hdTZVXDfi/aH/M9/LsfAGstMcvRsKqegv/qf46i+lv+xqvPyyssZQYZ/aapw
 p+O1Cgt9szY6TGlYfJIFynkjfz2d9yd5VIc8rueL37ArMMzkyavr+IMuyW8ONtxVvvDV2TwbXE6
 U/Ry+0uzJNAKspAMESgkX9q8JF1sd3o6BDJH1w3cS1F+n6NjNqccYKwNSMrol+khwlaBmOaE23o
 bDNTHnbMYu1hm0ZbOT9N9YeZWKTjG640c+WLr+70lCMLEGXfvrRXq+ywi5fs/dLv7/qEUkQLDjr
 F523x3Kih3JyjM6XX16jiIFsNg3H8JvCu2IeedZHURnDX1K97nx9aTeVf3ua/5SN2chhoSly6d+
 ho+S6T9
X-Received: by 2002:a05:7300:bc06:b0:304:dfae:68a with SMTP id
 5a478bee46e88-3077b29b6c7mr7022266eec.28.1780887462237; 
 Sun, 07 Jun 2026 19:57:42 -0700 (PDT)
Received: from localhost ([64.186.250.142]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3074df3b234sm20199224eec.23.2026.06.07.19.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jun 2026 19:57:41 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:57:38 +0800
From: Chao Liu <chao.liu.zevorn@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, 
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, bin.meng@windriver.com,
 vivahavey@gmail.com, 
 Alvin Chang <alvinga@andestech.com>, Yu-Ming Chang <yumin686@andestech.com>, 
 Joel Stanley <joel@jms.id.au>
Subject: Re: [RFC PATCH 01/25] target/riscv/debug: Check only mcontrol
 triggers for break/watchpoint matching
Message-ID: <aiYvkZXHIObH_mK1@ChaodeMacBook-Pro.local>
References: <20260114044701.1173347-1-npiggin@gmail.com>
 <20260114044701.1173347-2-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114044701.1173347-2-npiggin@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1343;
 envelope-from=chao.liu.zevorn@gmail.com; helo=mail-dy1-x1343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Wed, Jan 14, 2026 at 02:46:34PM +0800, Nicholas Piggin wrote:
> trigger_common_match() has some warning log messages in it for
> unsupported triggers. Don't call it in BP/WP checking except for
> mcontrol/mcontrol6 triggers applicable to BP/WPs.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Chao Liu <chao.liu.zevorn@gmail.com>

> ---
>  target/riscv/debug.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/target/riscv/debug.c b/target/riscv/debug.c
> index 5664466749..4273ab7a8d 100644
> --- a/target/riscv/debug.c
> +++ b/target/riscv/debug.c
> @@ -952,6 +952,14 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>          for (i = 0; i < RV_MAX_TRIGGERS; i++) {
>              trigger_type = get_trigger_type(env, i);
>  
> +            switch (trigger_type) {
> +            case TRIGGER_TYPE_AD_MATCH:
> +            case TRIGGER_TYPE_AD_MATCH6:
> +                break;
> +            default:
> +                continue; /* No other types match breakpoint */
> +            }
> +
>              if (!trigger_common_match(env, trigger_type, i)) {
>                  continue;
>              }
> @@ -976,8 +984,7 @@ bool riscv_cpu_debug_check_breakpoint(CPUState *cs)
>                  }
>                  break;
>              default:
> -                /* other trigger types are not supported or irrelevant */
> -                break;
> +                g_assert_not_reached();
>              }
>          }
>      }
> @@ -998,6 +1005,14 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>      for (i = 0; i < RV_MAX_TRIGGERS; i++) {
>          trigger_type = get_trigger_type(env, i);
>  
> +        switch (trigger_type) {
> +        case TRIGGER_TYPE_AD_MATCH:
> +        case TRIGGER_TYPE_AD_MATCH6:
> +            break;
> +        default:
> +            continue; /* No other types match watchpoint */
> +        }
> +
>          if (!trigger_common_match(env, trigger_type, i)) {
>              continue;
>          }
> @@ -1036,8 +1051,7 @@ bool riscv_cpu_debug_check_watchpoint(CPUState *cs, CPUWatchpoint *wp)
>              }
>              break;
>          default:
> -            /* other trigger types are not supported */
> -            break;
> +            g_assert_not_reached();
>          }
>      }
>  
> -- 
> 2.51.0
> 
> 

