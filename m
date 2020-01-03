Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1inBdU-0006WT-Dv
	for mharc-qemu-riscv@gnu.org; Thu, 02 Jan 2020 20:20:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43478)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <rth7680@gmail.com>) id 1inBdS-0006WM-7Z
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 20:20:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <rth7680@gmail.com>) id 1inBdR-000422-0N
 for qemu-riscv@nongnu.org; Thu, 02 Jan 2020 20:20:18 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:37034)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <rth7680@gmail.com>)
 id 1inBdQ-0003zl-Qf; Thu, 02 Jan 2020 20:20:16 -0500
Received: by mail-pf1-x444.google.com with SMTP id p14so22826972pfn.4;
 Thu, 02 Jan 2020 17:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GD40s/tUbUanspRuAIelM3ult2DJvl9iASATBW5QYYU=;
 b=A7NS7d65+KO8/AXqM5iy7u1L6JLo7WvBT8ZnNh5dl+axIPPv2VFPaKnwrqy58lgcc6
 IrJ9JQfxteR8Ip7kklMCodxf0PPZnDMr11NaUGvoAMmjCMUELa3k+zyL74U4w4ZAzpeb
 K6IV9xHpUzVCo0oq3TCJUEtCsJ9i+YPt9xgj05FZwaIUfRM5pHEOrba/2Ms0O83QbPgO
 hElZVZswZUT+fF38zFu2CrXaTnDvepU6rwQjQ+QO8JSNRioe7f2aVNP/HJSP/Qm8cD2y
 JkhiWCBB+E3pvdO6WfZElTMhT1fZiU3p59QiJWGmO203qRvjvpAmb2Sv7ti5Ij+BQ5HB
 Nl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=GD40s/tUbUanspRuAIelM3ult2DJvl9iASATBW5QYYU=;
 b=LHutVAeq3ricvmXq3i1S46ORWEsKRTdlWEyH9vPpCSDyeMKQJlat3U7yvgBf+TGaSl
 YF/SUhyAQLxfpckOdmedpa8RosxmZPGaWQ1GDgPOiToj+4sFUzDdMYgc2ijVAKzFOXOp
 GwBRTjgn49/j8nyR6FXFap58G1rQKelHSmOJ8MurRwyP3aGZJciLlKucpFqu2a/LDkep
 7XVL3EWCDoB3L8vW2zwAtlaVPTn+DOQcM+U+up0kJ0IULrm19Gg6iXIStnec6D3vy8ok
 yKqqAqFfWihDlc74iampnZIst/0lQuG+XSry5jWobjecuU8TBWuXge3hUzmYQTweyaSd
 nyWw==
X-Gm-Message-State: APjAAAWsY/eLeG0pyLKyJttjvOo5Ey61T1hlgJj/yM6sTOGxuH/ZJCqO
 aqzHFHlERLJ8U2gdVFHSvrs=
X-Google-Smtp-Source: APXvYqyTSjheyI6n364IpYP5Sqnq5cjq+aQ3bF/jeKEzgFpqkeFJR8UgReE0JyclZ7kgqJio14k4jQ==
X-Received: by 2002:a63:484b:: with SMTP id x11mr94312119pgk.148.1578014414825; 
 Thu, 02 Jan 2020 17:20:14 -0800 (PST)
Received: from [10.103.5.8] (59-100-211-22.bri.static-ipl.aapt.com.au.
 [59.100.211.22]) by smtp.googlemail.com with ESMTPSA id
 o134sm61034779pfg.137.2020.01.02.17.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 17:20:13 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
Subject: Re: [PATCH v2 0/4] tcg: Include tcg files using tcg/ dirname, reduce
 cpp search path list
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Max Filippov <jcmvbkbc@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Anthony Green <green@moxielogic.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>, Chris Wulff
 <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Stafford Horne <shorne@gmail.com>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-s390x@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Riku Voipio <riku.voipio@iki.fi>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-riscv@nongnu.org, Michael Walle <michael@walle.cc>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Marek Vasut <marex@denx.de>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>
References: <20200101112303.20724-1-philmd@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
 mQENBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
 n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
 rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
 Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
 n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
 AAG0I1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+iQFYBBMBAgBCAhsDBgsJ
 CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAIZARYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweUY
 BQkP1h/pAAoJEK0ScMxN0CebqDsH/0YyfnXk+Dc++H37VCEKgRet2i1ATFzxRnifkvmdxha0
 V+PVptQ2fwSe+w3KxoFecD8W75nysmUjrU/FicW9yU5YRlGONPZjruG02/KzmhA5PzWJdYO3
 i/t0qRayvWIcX2qA/flsXEbmb/BbAFM05LQIdcOu74eiBFe5CBCOWBDJeneE1urIE0hSYxoh
 nCcG60ULrNj13ohZ4zAEluoY32qIo7/OPWmtR88cPrEbZT8k+RqgZbsotzaPT1/RlL74fL8k
 ofYfTgKAFH7eEy6fF2nzDp2GThVn+3sA62xtpSXUf/X1m75B40KOcq1EQbHypNTmBc1wt13e
 ibhPNEVX2am5AQ0EUa4sLwEIALITHfH3gciRNfQIe7awDTDvn6H3C6gDyCAnv5LiuLTLZiyK
 NZp3lNO3rPowyKrGT2RIDlumlqPgdeHzqEEX91YK0yk2vdFvwU04rJ4D+qRgdUPoeICLD1zo
 PwOv2FaY6Tf8dKYas1RHF5QU5yQNey8j7IYYoE2yGPn2PtBmvtmK4iLataUEvx0U385Zr+jf
 HscqwTiToryeDC8Io/9BsMvAssE5Yf5URS2nJ7LFOvc4njsQJPF1i9egBXaIloqv7p2hVCKJ
 Hl5UWIxitQ9QQIl6iU4LCpz8mVYTXwv48IAVpbUf7+ak9V9Kk3jCeQnlxCJBUHjUhoIzinbS
 JHPHtkkAEQEAAYkBPAQYAQIAJgIbDBYhBJyxjdr46EmtKvwWpK0ScMxN0CebBQJdweVIBQkP
 1iAZAAoJEK0ScMxN0CebGHUH/RtouOlWl6To97tQsTJUq/2YwmRpFOsvV0/zCX4fKBGAbeZi
 VaELSt2+3UEErA+n8HwbQmjJ6IrdhA9GustOpOyCcbLVSMwql/OlAwBtDzCcC8dTU4zcuY2a
 rGG2A8i5krU85G9r1wowVcWZBsdmW7/dKiNoadLQiig4bHNiSaV4ograas5efyEjqTxiY+yG
 hzPw5DK2kbp2co8iDF1vW0LWPeLFBinCgItcI9LvgHWaB3rwjOfvNpMn5m64SoQYHB8wbnid
 erAjOzkBzmqnfS1tAUr8mtESStEwrEmNv0ZoA6S0Wt+c9pyTr+BpG4OFlhj7ZI+Eh7zOrr33
 q9OBIdA=
Message-ID: <ea560ebf-7ae5-a72d-2f03-e7097ab0ba8c@twiddle.net>
Date: Fri, 3 Jan 2020 12:19:55 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
X-List-Received-Date: Fri, 03 Jan 2020 01:20:19 -0000

On 1/1/20 10:22 PM, Philippe Mathieu-Daudé wrote:
> Noticed we could clean this while reviewing Richard patch last night:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg667606.html
> 
> Since v1:
> - moved headers to include/tcg/ (Paolo)
> - include in .inc.c relative to parent (Stefan)
> 
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg05356.html
> 
> Philippe Mathieu-Daudé (4):
>   tcg: Search includes from the project root source directory
>   tcg: Search includes in the parent source directory
>   tcg: Move TCG headers to include/tcg/
>   configure: Remove tcg/ from the preprocessor include search list

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Will queue shortly.


r~

