Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k1XXS-0004lX-9M
	for mharc-qemu-riscv@gnu.org; Fri, 31 Jul 2020 12:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XXR-0004kc-5X
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:05:41 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:38886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k1XXP-0005R5-C5
 for qemu-riscv@nongnu.org; Fri, 31 Jul 2020 12:05:40 -0400
Received: by mail-pl1-x634.google.com with SMTP id m16so17666363pls.5
 for <qemu-riscv@nongnu.org>; Fri, 31 Jul 2020 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=apGZ8hFP75wp/mpTw5TzO6V6EX6PIao2LdYoX3KRzN4=;
 b=yecR+UBrdRU8ElY5ohznsYxDndLHbZNTxt4ojIqbAVVG/1vUutFQuz4NgqC4h171l1
 rYP1G9JfEj7V0CjyjBuIxjkihwIJEQpor2n8LT4ibRxgPBLcqMD4LUZhdKj0BF0qvARD
 +7ottNuOZrG7QmIb4+pqpkR2C1JCXO539ENN6gzhmVzHGbUNBOQDFZdBEfKhZuAOot+Z
 vhWA8V4cr2iJpIOlGvNINTG/dK9qWhFMSN3uZoMkwAByD8aEsAK8dZG8YZWIIGBh9dUO
 dgk9s5hbdL3f7hi4wzG2Zk1B3GQcOR5x7PA+D5v0wYUgi4QI57PazaLkh+QuYGaYdgZx
 Rcag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=apGZ8hFP75wp/mpTw5TzO6V6EX6PIao2LdYoX3KRzN4=;
 b=YzoXjhEFIkUPczYUJHTCa024Napv8E4Zu764txsTiak4wM9lwwCx5lxSzq0gXZjhm1
 jqREO7iT6bYINGD5+EQYjv/c6Obuwd0fNtIwyuUTEQbeX+Rq4c05vOmU8z4IKvoara+G
 7kRmGMXbP/DUsyiifVCwUUNWz96poE3lSFedUKYYzSDMGjBQkzFovxYDbE1UBwbooREs
 vUShfrhVpY0gJIR4fg2zh55afno8XHi+ExBvoLt5j6byrnhL8ZtTMkiSpA5PsiJXYdm5
 4Zq4O1XO0hPG7za6KyjBgcmfb+xnEbFA+MCQfL7JDeOqqGgjCq32VduU2YMDT47DyZ4m
 oK/Q==
X-Gm-Message-State: AOAM533y5h1AthsWeX5W/HYrgx9IjicbA9VoxI+R9uhD4lozm7tFU4MB
 ZUkeNy7r2wae5160fDwiiCOzjQ==
X-Google-Smtp-Source: ABdhPJw9H2smOHE+wzEBWA6AicJ4so4jEcYc2Hdij3r3ZF3TKwv1Blxcu/OwAXs9b0ANzcW77dT6XQ==
X-Received: by 2002:a17:90a:f192:: with SMTP id
 bv18mr4406776pjb.21.1596211537506; 
 Fri, 31 Jul 2020 09:05:37 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id n9sm9380989pjo.53.2020.07.31.09.05.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jul 2020 09:05:36 -0700 (PDT)
Subject: Re: [RFC v2 59/76] target/riscv: rvv-0.9: floating-point slide
 instructions
To: frank.chang@sifive.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
References: <20200722091641.8834-1-frank.chang@sifive.com>
 <20200722091641.8834-60-frank.chang@sifive.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ae82210-965a-25cc-46d6-f3d2e05e88a5@linaro.org>
Date: Fri, 31 Jul 2020 09:05:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722091641.8834-60-frank.chang@sifive.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Fri, 31 Jul 2020 16:05:41 -0000

On 7/22/20 2:16 AM, frank.chang@sifive.com wrote:
> +DEF_HELPER_6(vfslide1up_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1up_vf_d, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_h, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_w, void, ptr, ptr, i64, ptr, env, i32)
> +DEF_HELPER_6(vfslide1down_vf_d, void, ptr, ptr, i64, ptr, env, i32)

You should not need new helpers.

The only difference between vfslide1up and vslide1up is the source and the
nanboxing.  Which you can do in the translator before using the existing helpers.


r~

