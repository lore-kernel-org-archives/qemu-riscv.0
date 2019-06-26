Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hg3KF-0005Ec-4a
	for mharc-qemu-riscv@gnu.org; Wed, 26 Jun 2019 04:30:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46712)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hg3KC-0005EM-Td
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hg3KB-00071d-Op
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:30:40 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:33100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hg3KB-00070O-GN
 for qemu-riscv@nongnu.org; Wed, 26 Jun 2019 04:30:39 -0400
Received: by mail-wm1-x341.google.com with SMTP id h19so4057165wme.0
 for <qemu-riscv@nongnu.org>; Wed, 26 Jun 2019 01:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x95I5XIyWaxdtAMUUb7Ziz5yTxqF7tt1iEC+xwVz9Ks=;
 b=LIB5sUkl3Tf6N1J0CQK8+DTuVQSBulwMNfs/nR8TfvVF9wMq1XJ5Powz39oz04WpF6
 GNxEDhMYA2v2rO2m5nKn+y+AIny+wFcFbdxtTMLYSKYokXarQvWGyk4Ws+6gS+sgUsnV
 Ogz8yweazMlNa1dLscs6UdoXsMPsvlap0S7arfkgmqH1+oD070pcZu5iycCk2p9eq1Wb
 PN60aCRuF0sUIacADnI+3JaO9j5FBO+IyvcG46RLwRQyRwrs3IXTMIY6LA3aS4Yp8RdY
 qxhib52M4cjxKBnIZLWjqrRhXJU2AwOgn8LcQeM2sNFRgecFZohH2UxPIgGEdyM1fjJY
 1q8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x95I5XIyWaxdtAMUUb7Ziz5yTxqF7tt1iEC+xwVz9Ks=;
 b=UXPjor5ACV4/F6vYK9Ju38NZqMNeRX5OnmjM+frvCSjbffbTgOY8eMWRSiu8uf1N71
 kJ4G2c91tp86GtjfH1DP3E2T/LMmW/gjAZoLfKFf5krWBVWnjuBl6D2v2VS0O/320Cwm
 9eNB/b0YRU7zj+BH4fnqwdxmrlRt3/I3ztinxkxiLyUCnnvxJfdeRD/VtcGQD8SqEsaO
 8Q0TKMOBFZgxz/Y8FvfYgnak+bfqvX+cmMhbjtyIA6Q1vKOirvlJeCl1VSD4ZFRlhztd
 ejzqgStWmf9yrQiSNRgtSpcoYF1rzv0eqZnKaHyR5jKUhO74rUREQS1eRZDLjElcJAAS
 Z3DQ==
X-Gm-Message-State: APjAAAWwvMNLI0zb2SVOYDH5eVpZX078EZzKfj7ZuMHNv5isRjQT+6Cm
 7Xj2p1txMJDT9BaZwqm6HRB+xA==
X-Google-Smtp-Source: APXvYqwICU+2ZOfTuVgg7zSTzL7Cm9EWj/Jsp93qOnYWTz6uReNgfp0Ej1Tw/sj0dMgbg4gRX05yiQ==
X-Received: by 2002:a7b:cb08:: with SMTP id u8mr1747204wmj.167.1561537837835; 
 Wed, 26 Jun 2019 01:30:37 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id l12sm1069154wmj.22.2019.06.26.01.30.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Jun 2019 01:30:37 -0700 (PDT)
To: Palmer Dabbelt <palmer@sifive.com>
Cc: joel@sing.id.au, qemu-devel@nongnu.org, qemu-riscv@nongnu.org,
 me@carlosedp.com, Alistair Francis <Alistair.Francis@wdc.com>,
 marco@decred.org
References: <mhng-c3bf2d26-25cd-4f80-bfe9-741f9a969b3f@palmer-si-x1e>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <77792d70-b438-df37-6fe4-b5723f7da99d@linaro.org>
Date: Wed, 26 Jun 2019 10:30:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <mhng-c3bf2d26-25cd-4f80-bfe9-741f9a969b3f@palmer-si-x1e>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::341
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
X-List-Received-Date: Wed, 26 Jun 2019 08:30:41 -0000

On 6/26/19 10:25 AM, Palmer Dabbelt wrote:
>> You misunderstand.  The code is exactly correct as-is.  The alignment check
>> happens implicitly as a part of the softmmu tlb resolution.
> 
> Sorry, I thought you said it wasn't happening for linux-user?  If it happens
> for both then we're good.

Oh, that.  No, there's no better way for linux-user.  Though honestly, if we're
going to fix this, it should be done in tcg/* rather than adding hacks within
target/riscv.


r~

