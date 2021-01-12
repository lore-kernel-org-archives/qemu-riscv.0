Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzBhz-0003je-OJ
	for mharc-qemu-riscv@gnu.org; Mon, 11 Jan 2021 23:55:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBhv-0003g8-VC
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 23:55:04 -0500
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:32842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kzBhs-0002hL-4O
 for qemu-riscv@nongnu.org; Mon, 11 Jan 2021 23:55:03 -0500
Received: by mail-pf1-x434.google.com with SMTP id h186so677784pfe.0
 for <qemu-riscv@nongnu.org>; Mon, 11 Jan 2021 20:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=T/UNCIXKrjvOHulEfNmJpqF+Gdm49aMF19TLIaNs8DY=;
 b=dUTJKJCtKGdznCcHYJxM3/7tfFt/UfTq4tszSud7KRl/rX3OnDwRoYvZFICL6YYxr5
 KMcuUJZXvPlYNobA5uKpELl0xyIRCARajkOdOz6bFwBDl455aqx82K92X3TWIYqHF5ED
 TO4YNjC1bTdbL9BDxJcBlghxc+1NXLM3RS5ZQel/73B3y0FnKGv/g9lFDGi5uiUAwLvR
 dLsafEpdILBLRVb4DcYRUW3qYyzWoPhngFWnbkso4fd3WjHgZ9NyYfRw8NgVteqHerms
 /ty1NVQzHNBzLApLUmCXoG883HkBEFZVeLhs0X/RO3oz6txcVudGsbMbjOSSRGVSuI2O
 KjrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T/UNCIXKrjvOHulEfNmJpqF+Gdm49aMF19TLIaNs8DY=;
 b=p7TilGE8bK0ottcObsy30diwwnXoPOI/s20hm/s3G6GqRAYVAJO2u198PghmAq2Qe7
 SLpEyFAL0vYWUHHYjpCGjAV0ftF9jUYxAFu1Xz3BKfvSBXA0Y1TRZb29vu1fojOKsuv6
 hoZwwNI4b/f8okaq5H6JyadnZKtXdJEEpLccGW6w8eCtvb7trf1ed86OVCP6Aupu5zTS
 ebOR+vDvjMSUVRb5XUNUcTS2XfzhHJR9nIsCxKpyz+j2BP1ayU1KTk3KhGCy5IMO5pw/
 mBbFWcLdBSlYxut/BZtG1AygyGxXWzrth8ol2n3ab3xWdGbgbmEHFlzat+jsVELmp3kt
 tN9A==
X-Gm-Message-State: AOAM531vausFZMc9uzcErHJ28z7vz6z2QV2IgchN8icnSw41cIdBP7SC
 ywsKpcpsO+JtS9lrHrq8bCP5ZQ==
X-Google-Smtp-Source: ABdhPJwMUwJPqXOlLt7SYMffL7Y3Re8w7vLPi750c3pUYGn08pHwUbeaHWAQLw3Bnvwi0Mmv+/+7Ow==
X-Received: by 2002:a62:1c16:0:b029:1a6:8b06:68e9 with SMTP id
 c22-20020a621c160000b02901a68b0668e9mr2769101pfc.45.1610427298413; 
 Mon, 11 Jan 2021 20:54:58 -0800 (PST)
Received: from [10.25.18.36] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id t5sm1161137pjr.22.2021.01.11.20.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 20:54:57 -0800 (PST)
Subject: Re: [RFC v3 08/16] target/riscv: add gen_shifti() and gen_shiftiw()
 helper functions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20210112022001.20521-1-frank.chang@sifive.com>
 <20210112022001.20521-9-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d0f3c27-8f0d-1386-7ab0-9e6e5e1a6c53@linaro.org>
Date: Mon, 11 Jan 2021 18:54:54 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210112022001.20521-9-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jan 2021 04:55:04 -0000

On 1/11/21 4:19 PM, frank.chang@sifive.com wrote:
>  static bool trans_slli(DisasContext *ctx, arg_slli *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
>      if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_shli_tl(t, t, a->shamt);
> -
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> +        return gen_shifti(ctx, a, tcg_gen_shl_tl);
>      } /* NOP otherwise */
>      return true;
>  }
>  
>  static bool trans_srli(DisasContext *ctx, arg_srli *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
>      if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_shri_tl(t, t, a->shamt);
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> +        return gen_shifti(ctx, a, tcg_gen_shr_tl);
>      } /* NOP otherwise */
>      return true;
>  }
>  
>  static bool trans_srai(DisasContext *ctx, arg_srai *a)
>  {
> -    if (a->shamt >= TARGET_LONG_BITS) {
> -        return false;
> -    }
> -
>      if (a->rd != 0) {
> -        TCGv t = tcg_temp_new();
> -        gen_get_gpr(t, a->rs1);
> -
> -        tcg_gen_sari_tl(t, t, a->shamt);
> -        gen_set_gpr(a->rd, t);
> -        tcg_temp_free(t);
> +        return gen_shifti(ctx, a, tcg_gen_sar_tl);
>      } /* NOP otherwise */
>      return true;
>  }

This removes the illegal instruction check for rd == 0.

In general you don't need the rd != 0 check, because gen_set_gpr will handle it
(and it'll be exceedingly rare, and therefore not worth checking by hand).


r~

