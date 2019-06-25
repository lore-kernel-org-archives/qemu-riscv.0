Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hfnUs-0001rD-TV
	for mharc-qemu-riscv@gnu.org; Tue, 25 Jun 2019 11:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34022)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnUo-0001pt-Mi
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hfnUn-0006kT-8M
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:36:34 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34100)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hfnUm-0006ij-FI
 for qemu-riscv@nongnu.org; Tue, 25 Jun 2019 11:36:32 -0400
Received: by mail-wr1-x443.google.com with SMTP id k11so18444018wrl.1
 for <qemu-riscv@nongnu.org>; Tue, 25 Jun 2019 08:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EOXiXqRkOBnlWG2kLlaZsuMqLACxnqUCtoQCgNdNGHQ=;
 b=EAKAeXQHuYOaCw0CIJlmAGs81ognnLHgoWaMTWsDTlE3lyiu1V07NAMO0KGKbIAk93
 4egUneO+TZab3oeGry0d/jmfRG98vpMS1tQRy+gEOT8pYQU5Zer9qMpvpGo3N0k8qZtu
 jY5+lqS09EXSZfhDKtRjFucCVQy+vdzGXxxWCIQnoVOTEnKlTn3H0CO839T89bbyieZD
 5G6oZjOxMxcfu6Q4GVX1kIYHFSgx8dAEwBCBNqK3ypNAvEJv3A4oiUu1bHSnFeXbCeqq
 ttjKSNNmjAUl/Iqev0Ku7DeeTBPUO/wb1XpWrG6bzc0fMxQtQm/mRB2lDC3Dv7NnDfhV
 7rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EOXiXqRkOBnlWG2kLlaZsuMqLACxnqUCtoQCgNdNGHQ=;
 b=LGmeMv4gmPIpftgcPYD32xgzy1K0SzrT4TOHbVFBZbOgfR4HHH+iQ6Lys2z6qfJ6K7
 zVXjEOABFmlpnTQK0H20WcQbPuvzjP7uC5HR0oeY1KfQGJqnVNmW9NMjtfyFjQe140RP
 XtdT6Hub06+ZnVChyb1vlSDrfvDFgDHMc+zwKN5J7SOExYBW8cUVODpZOQ//LONmBMJV
 UnguVgcfkaEED8kKXaQ4hzzIKzP4/xKE0BzuFN/ubcMNXdaKwbOGOzwp/OFkzEVrH7/A
 gWeLhs9llKGvYqZhWtTpm3uDoH2Yssoz5sgYYJ9GUJCj4hJxcpZbuEEWMQaX9k2I/LvM
 ZvZQ==
X-Gm-Message-State: APjAAAVOx9eOG8uVJnXa8ph7vGMrQwgAeqhUpWHXpT4vopZtc4HKc4gi
 tAJCm4aHbuosuZNq72e0OTqN5g==
X-Google-Smtp-Source: APXvYqyD8hCkcsWYnDQpfX9oIVeRdGOMYAkW+61Y+0dj0/ziOrt4vQK3ol4hCy9Bp+n/Zn1lA31njg==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr63977390wre.248.1561476990653; 
 Tue, 25 Jun 2019 08:36:30 -0700 (PDT)
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it.
 [93.34.153.63])
 by smtp.gmail.com with ESMTPSA id 128sm4317958wme.12.2019.06.25.08.36.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Jun 2019 08:36:30 -0700 (PDT)
To: Joel Sing <joel@sing.id.au>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, me@carlosedp.com,
 palmer@sifive.com, Alistair.Francis@wdc.com, marco@decred.org
References: <20190616191900.GH61734@hippo.sing.id.au>
 <41ef5fbf-f438-e60a-2fba-a72e3ad422f9@linaro.org>
 <20190624180837.GM61734@hippo.sing.id.au>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <2dec03cb-22af-4d0d-f182-3bee9db83d6f@linaro.org>
Date: Tue, 25 Jun 2019 17:36:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624180837.GM61734@hippo.sing.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Tue, 25 Jun 2019 15:36:36 -0000

On 6/24/19 8:08 PM, Joel Sing wrote:
> Regarding the alignment for reservations, the
> specification does require this, although I do not recall seeing any enforcement
> of this by qemu itself.

Ah, I see it now.  Enforcement begins here:

static bool trans_lr_w(DisasContext *ctx, arg_lr_w *a)
{
    REQUIRE_EXT(ctx, RVA);
    return gen_lr(ctx, a, (MO_ALIGN | MO_TESL));
                           ^^^^^^^^

This will force softmmu (but notably not linux-user; a design limitation) to
generate an alignment fault for an unaligned address.


r~

