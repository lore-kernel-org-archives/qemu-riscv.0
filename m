Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j7Pq1-0001R3-7U
	for mharc-qemu-riscv@gnu.org; Thu, 27 Feb 2020 15:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58241)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Ppy-0001Qo-GI
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:32:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j7Ppx-0005RI-Dn
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:32:50 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45608)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j7Ppx-0005R1-8t
 for qemu-riscv@nongnu.org; Thu, 27 Feb 2020 15:32:49 -0500
Received: by mail-pf1-x441.google.com with SMTP id 2so409907pfg.12
 for <qemu-riscv@nongnu.org>; Thu, 27 Feb 2020 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RxLRweVsvovvjSRd/aJpY25AKGzdRZNzZJoWjRF6zCY=;
 b=PBrwfxDAnQyXx62ymEjaK9WP5oudmqN8Ly4gQiPAUEc2Qe2Ebfq51cia2yF7EOQWEO
 5v1ekf5lJkvK9wtaBdD6gqirg9Cykl0ZpyDMDLmpqfVemJEGfWaw8XyTHC6qiFLbn1ME
 MDqzUsA0UzGBU/EJ83M2yV+25h07Tgh7zH++HtIOns37/HrW86CVzleeTHj1UlG4LQrP
 3+dNkl2tHJzHSPSSQXbDvib9yno+DUwG85h+VhQ//tQbOewmjkgEFMZWYdad0zQClayp
 S6P8oEu9JStnkPh7/+W74qhPzFRp5RpPBOBLfaArr2yYhcU7kNUxP7KEX3cLkHwsPfc0
 d8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RxLRweVsvovvjSRd/aJpY25AKGzdRZNzZJoWjRF6zCY=;
 b=QhxCMZTcDWcqhL5bfaX5Co3NLb9q8C94An2jCDSIrmNYh9NJnKTJRVgnWpNQ4a8YgK
 +zGQX7XS2PLmyqb0/otvVTjLii1mHG9YODjijLB9RxdVEzMtLIeKPKruMHZlqt7WLO3D
 LPT/zigUuQO2+qA7tOCKQJk1oSmEEDFzpE9G34znv9Z2dftYEy4XrFuUeBCTsBBjjxqH
 KDzGwa7yXopvEFm4xWLGKFbNhoN5wgDpUnsD4ja23ZqNoIkefzBBXxHySfjX0nsC4iLo
 5BcIpmKZuOY75RxFRhcbKnrsEYpDwXgRrn9yPGRpVQmpi9zRUcWcmnajD4FahXoO+rxJ
 lMyw==
X-Gm-Message-State: APjAAAVE9dLk3tH0KvlW+n8Xp4Tv2fLSqpFM2ocjwXjhD23nr1oFCzWG
 nx97a82/aaxFb+bFfF7h41iiGuIBGWg=
X-Google-Smtp-Source: APXvYqyfnbIqxT5ouONNIMHqLutghxnOAMq6doC0Un5lnZS0odiD+0xpnkZUXkupQXuNP8mgv2/G+g==
X-Received: by 2002:a63:c546:: with SMTP id g6mr1017673pgd.243.1582835567976; 
 Thu, 27 Feb 2020 12:32:47 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r3sm8528585pfg.145.2020.02.27.12.32.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2020 12:32:47 -0800 (PST)
Subject: Re: [PATCH v5 1/4] target/riscv: add vector extension field in
 CPURISCVState
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Cc: wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <20200221094531.61894-1-zhiwei_liu@c-sky.com>
 <20200221094531.61894-2-zhiwei_liu@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <229be418-8fe0-cb5a-3ba5-3ea85f2843f0@linaro.org>
Date: Thu, 27 Feb 2020 12:32:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200221094531.61894-2-zhiwei_liu@c-sky.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
X-List-Received-Date: Thu, 27 Feb 2020 20:32:51 -0000

On 2/21/20 1:45 AM, LIU Zhiwei wrote:
> The 32 vector registers will be viewed as a continuous memory block.
> It avoids the convension between element index and (regno, offset).
> Thus elements can be directly accessed by offset from the first vector
> base address.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
> ---
>  target/riscv/cpu.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

