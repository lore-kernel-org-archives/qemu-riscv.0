Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jD2mf-0006NR-Jf
	for mharc-qemu-riscv@gnu.org; Sat, 14 Mar 2020 05:08:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2mc-0006LA-JT
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 05:08:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jD2mb-0008T8-7T
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 05:08:38 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jD2ma-0008R0-WF
 for qemu-riscv@nongnu.org; Sat, 14 Mar 2020 05:08:37 -0400
Received: by mail-pg1-x544.google.com with SMTP id a32so5619337pga.4
 for <qemu-riscv@nongnu.org>; Sat, 14 Mar 2020 02:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FAMcJQAFrXIY8F3+mTu0MyN3DE6W++w2LB1aMVn5Jaw=;
 b=wNEUkZgpg0dX8ru+K0z/VYnSL8LJbfH0ZvmbYc4yLjNi5N/BvsZ4qjp+9ZrKag43ZU
 qWDrGtpR5seNCux58ohamFmPTgcjRyMfhlmQsjGr/CD3b2pPcniIxdjBVBmTKsuZxbsE
 yeK6q/uzH+KvrrEh1ZpQva0AebX7vRJjDZYfzCsU+PbzlHvavqJ5fWH7jvi83Zi/PoqZ
 djSrtyzsRy7cZUfpbGyGiGmLPm6Fbt1Gs/B1yS79c1+gYncsYK5rradW4gnDCgbmJp5M
 HZ2eIdqbHWTj+lGDfM/FvrsgeVUgsUhMTmnbRUWc5SazPyI6crNFyqKMlHsI0a2IRMRL
 Hz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FAMcJQAFrXIY8F3+mTu0MyN3DE6W++w2LB1aMVn5Jaw=;
 b=udQEQL7m8EcKdglqIc0INp/OB6eyuUoY3KJGnI/ivZaOREZpEZg51YOEqwytiYjFXS
 u0qgirkgssl5ZRlqtF20Iw3VtfLz/gHCbHEUs3Q49GQhkSXmkE/DPz8qIUYo4TkPDhV/
 ceQbjc9ZQFnzp6F6vJHXVKnBfOmGMumRQka13EQ8pbeC0/Nc92ais7qWj1Ki5U5xzhzD
 nKhyrLaA5q+9KrRG7VJT1FE5mRANNmzx0Hlds+zufOWzyIYhLGsehZ+KAo7+SgAW112X
 +YGRG0tno0n80jKlILSvnuEhsnqeTdnHz8NyxgeDB4ivOpPnvg51MlOEoiHNJLyhOZwH
 dUDw==
X-Gm-Message-State: ANhLgQ0gXB7nZSiysrLJAWanpc9lDlNAuEPaF9/sA91nYZqhsi8+TNfY
 oy8o9umUvGPeXQNHtFCDcxGLSvpJ8T4=
X-Google-Smtp-Source: ADFU+vs7N0hheqsOmGbCwEacTMpGqqaeCtmJnvC+ji0sGfRC7wwIYd6MkemEYkIwCuE79+Xncjy/7g==
X-Received: by 2002:a62:2e06:: with SMTP id u6mr17240236pfu.262.1584176915538; 
 Sat, 14 Mar 2020 02:08:35 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c83sm19908328pfb.44.2020.03.14.02.08.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Mar 2020 02:08:34 -0700 (PDT)
Subject: Re: [PATCH v5 38/60] target/riscv: vector floating-point compare
 instructions
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 guoren@linux.alibaba.com, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200312145900.2054-1-zhiwei_liu@c-sky.com>
 <20200312145900.2054-39-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <cf8688d1-560c-73f1-8e62-559df34e3eeb@linaro.org>
Date: Sat, 14 Mar 2020 02:08:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312145900.2054-39-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Sat, 14 Mar 2020 09:08:40 -0000

On 3/12/20 7:58 AM, LIU Zhiwei wrote:
> +static uint8_t float16_eq_quiet(uint16_t a, uint16_t b, float_status *s)
> +{
> +    int compare = float16_compare_quiet(a, b, s);
> +    if (compare == float_relation_equal) {
> +        return 1;
> +    } else {
> +        return 0;
> +    }
> +}

You really need remember that boolean results in C are 1 and 0.
You do not need to keep translating true to 1 and false to 0.

> +static uint8_t vmfne16(uint16_t a, uint16_t b, float_status *s)
> +{
> +    int compare = float16_compare_quiet(a, b, s);
> +    if (compare != float_relation_equal &&
> +            compare != float_relation_unordered) {

Indentation.

> +static uint8_t float16_le(uint16_t a, uint16_t b, float_status *s)
> +{
> +    int compare = float16_compare(a, b, s);
> +    if (compare == float_relation_less ||
> +            compare == float_relation_equal) {
> +        return 1;

Indentation.


r~

