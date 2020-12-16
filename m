Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kpZmJ-0004Ea-Qt
	for mharc-qemu-riscv@gnu.org; Wed, 16 Dec 2020 11:35:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZmE-00048r-VX
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:35:48 -0500
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpZmD-0000VR-Ig
 for qemu-riscv@nongnu.org; Wed, 16 Dec 2020 11:35:46 -0500
Received: by mail-qt1-x82d.google.com with SMTP id v5so8388192qtv.7
 for <qemu-riscv@nongnu.org>; Wed, 16 Dec 2020 08:35:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XshYBTWOs6WYuMm8rm7zc65jG4ltBnYLe9EyuHZMRNo=;
 b=CMbRlH59XWw++fk+YCUVxtN0mfKWcRBngZLWFKJhV+MRSae4OC1iQ1d9cK90NF82TN
 MDq6X2XPHYEMdRJptlbHl8MboBq4GvFLuA/Nx0mX+W8Ipo1n/wDaK86cOKIg8Uhec1XN
 XCSEaw/RQ4KhFMrhjvVYBCG4yd2/4o4p1VV+mMAvVlc0M/Aoh0HjbftxQwDbR2kIOPEP
 MUVdfWBReiPZFAfjVATVyU/urAGGWQwdhld5svD720s2E4YnNd5xz8dT+YEi4WHMfnZK
 KsEK0g1cERegmCri6/8LvJzDsFHu8IWZWfQhvF82HiyKXNfqptk2b944WKAHCsRM2f5V
 NMKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XshYBTWOs6WYuMm8rm7zc65jG4ltBnYLe9EyuHZMRNo=;
 b=a/Goa2LAEFc7C/vxHfviomYaJP2NuJKiYMtUKzQTlkJyfGWRUO2drRhpavoe5xOQ+e
 9eAEY3uS8y2YJu8oJZdVoiCSGA46xW7qJ8lG8orazePg0vns2AgN4Xo5kDDwFU0yWLQz
 KN+OV3Bl7DXAax6WaSImMsbVMvTnLKvdXDF2eEwApKW+STJAAvNAFmF11d7fzRIMk9sd
 PlhfvVpNfjN15MsduE23mtY9Cq20Xx+XIu44EIIP8gB06YOZaLlY3TDNTaT8wq6ZMnKj
 LAOd7iBHxfe83oywjudiKoJVPe/KlJfmrrxbmM289wm6C/V1kgOVUAiLaRyY9t/BWazd
 VNNQ==
X-Gm-Message-State: AOAM532/WufRC+52qg08a0dJsLTy8I09iwjL+SDgkbz3vdFNMBRKgSts
 kAiSAhZHIQG2XKwSntx1DjkgWA==
X-Google-Smtp-Source: ABdhPJzg3uUEI7FkLVN2MJmhhpmhT0KO7SPF3NyAt/mpk8oMdN6eU5gwDVWa6WpBW/nXzLRoeWOKSg==
X-Received: by 2002:aed:3343:: with SMTP id u61mr37146300qtd.57.1608136544480; 
 Wed, 16 Dec 2020 08:35:44 -0800 (PST)
Received: from [192.168.71.34] ([172.58.27.195])
 by smtp.gmail.com with ESMTPSA id z15sm1393912qkz.103.2020.12.16.08.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 08:35:43 -0800 (PST)
Subject: Re: [RFC v2 09/15] target/riscv: rvb: shift ones
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
References: <20201216020150.3157-1-frank.chang@sifive.com>
 <20201216020150.3157-10-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e1c37cb4-7309-cae1-d995-4448beb5e7eb@linaro.org>
Date: Wed, 16 Dec 2020 10:35:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201216020150.3157-10-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
X-List-Received-Date: Wed, 16 Dec 2020 16:35:48 -0000

On 12/15/20 8:01 PM, frank.chang@sifive.com wrote:
> +static bool trans_sloi(DisasContext *ctx, arg_sloi *a)
> +{
> +    REQUIRE_EXT(ctx, RVB);
> +
> +    if (a->shamt >= TARGET_LONG_BITS) {
> +        return false;
> +    }

As I mentioned vs the previous patch, these checks should be in gen_shifti.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

