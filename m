Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hd1R6-0002b4-Mu
	for mharc-qemu-riscv@gnu.org; Mon, 17 Jun 2019 19:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51867)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hd1R3-0002aO-UV
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 19:53:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hd1R3-0002Ri-2Z
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 19:53:13 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:43863)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hd1R2-0002Qx-R9
 for qemu-riscv@nongnu.org; Mon, 17 Jun 2019 19:53:13 -0400
Received: by mail-pl1-x643.google.com with SMTP id cl9so4861751plb.10
 for <qemu-riscv@nongnu.org>; Mon, 17 Jun 2019 16:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3g8pvPHolz0Gk1ulPnQrys06815XnZv3bWSjWLJcUl8=;
 b=yegAvp02oYXPpTrY3JmyIMZswNcifeFxyWjr3jKxxxSM9W5qI9wmHEweQ2NTAmfpBo
 nuerGmsgpH+heFkmHr+OsyCnrwdOyhClM1z6KZ2NsNklRvcT+Fe261UG9exlMi/gbYTS
 rr7CcL3slStuRtr007Ot5QxxZzPGmd4g2xWIkkP/ArwlOpbWys5ecC9uj4fY4vvp1N2M
 mFPkX1L7G+b30sHz6oOEcf/tslTF1YEKfHX295Vm0+1W9oW0JHRiE+CRKHO9yRLH0P7E
 2AIRYBum3fAWtej5vcqq4aQfbG75EzidLIMhTfQgfIYdMdom68pI3E322SZ/x241QK7U
 B7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3g8pvPHolz0Gk1ulPnQrys06815XnZv3bWSjWLJcUl8=;
 b=pR3/Sc7L3CnANuiyTKOf9OsjROeVfsEz4Em9BiTzYf9ySJYMwAEnyA403vgbUMnzqa
 tV4vfPG6Fb9EpCTWSnUE8hDEH4lSk34G/ZBbYD0FZGyAI2fkRLG1GjfXFeJZfi5fIuPR
 rWzHQzBmp0aS53kEPOfJQ/1ChtK6wjuI+HhojVNZYGUxSPQV0NV/Y2wMHCr62qzH4GkM
 RfwiAQEQliPdHAMFRkB2g4QiyPXVCeXyKEAVIjOwOUf7yQO7Bjq/YzAp9dxFTd4w0jpc
 FuIybIzbd018VpQZkzi8hUe6bs/wjSspGUlPshUxXWibF1KhGTXhoqc5tMoPCrzzqIcJ
 747Q==
X-Gm-Message-State: APjAAAUoQwaErOvDsKnjH4AeveCAaLNcjbMy9T2B0qz1UPw8uN7XK7/6
 Cmed+hRvHw/y7/RRGpdhZhQ+tA==
X-Google-Smtp-Source: APXvYqzYBgEm0DlhXI1zV9rjEEXAEKSl6pGqFWr4vhZghUZOPEVCYnd4xvgcS6Z7rocbonTPe6L9dw==
X-Received: by 2002:a17:902:7246:: with SMTP id
 c6mr50743677pll.248.1560815591586; 
 Mon, 17 Jun 2019 16:53:11 -0700 (PDT)
Received: from [192.168.1.11] (97-113-2-33.tukw.qwest.net. [97.113.2.33])
 by smtp.gmail.com with ESMTPSA id b37sm399803pjc.15.2019.06.17.16.52.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jun 2019 16:53:10 -0700 (PDT)
To: Joel Sing <joel@sing.id.au>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: me@carlosedp.com, palmer@sifive.com, Alistair.Francis@wdc.com,
 marco@decred.org
References: <20190616191900.GH61734@hippo.sing.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
Date: Mon, 17 Jun 2019 16:52:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190616191900.GH61734@hippo.sing.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH] atomic failures on
 qemu-system-riscv64
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
X-List-Received-Date: Mon, 17 Jun 2019 23:53:14 -0000

On 6/16/19 12:19 PM, Joel Sing wrote:
> +    /*
> +     * Clear the load reservation, since an SC must fail if there is
> +     * an SC to any address, in between an LR and SC pair.
> +     */
> +    tcg_gen_movi_tl(load_res, 0);
> +
>      gen_set_label(l2);

This clear needs to be moved down below label l2.
Otherwise, with lr / sc / sc, the second sc could succeed in error.

FWIW, other targets have used -1 as the "invalid" load reservation, since the
architecture does not require address 0 to be unmapped.  This should be quite
visible in M-mode with paging disabled and ram at offset 0.  Often, other
targets require alignment for the lr/sc address, though I don't see that for riscv.


r~

