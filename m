Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iFnjb-00015V-BC
	for mharc-qemu-riscv@gnu.org; Wed, 02 Oct 2019 19:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48366)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iFnjX-00013a-Te
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:08:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iFnjW-0000uT-Ut
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:08:35 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35062)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iFnjW-0000qe-Pm
 for qemu-riscv@nongnu.org; Wed, 02 Oct 2019 19:08:34 -0400
Received: by mail-pg1-x542.google.com with SMTP id a24so544859pgj.2
 for <qemu-riscv@nongnu.org>; Wed, 02 Oct 2019 16:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DaO6bq36RSNja0H9UehPx0sTvcNKofrMBZiI0r699aU=;
 b=XJG41UlsPkpGWlwmyvPOXWcYxasDgLtpxQuQjEwRzayWLLCCs+htdrAeF6i0UU7CM7
 1QFdkEa7insbu17ABqbf+yr87p/Wf9zAWjVM0gkcCR529giASbIxc3KCfNqKN+ycroJ7
 nFRwVgL92uqbMcrmU+INA+YGSsQKBkwztlNaj8Gp5Lxa2B/iK0xo9dweDuh6H7OtDpLu
 PEMLkQlrg6ixtebd4sMjuskQVXNEuCGDNQIYqd7SZLvWUPDyCm3dV+Ylrp4WlP7bmRcE
 r4XSUM0JzuvPWMYFm5/HXfd789/1pV5lpk7dSpqnEeaXaQbPKnhKcswxBaPZGysAQzVQ
 7g/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DaO6bq36RSNja0H9UehPx0sTvcNKofrMBZiI0r699aU=;
 b=fuqn3fkmL2XXup/Bw8QKbFgEJE+qg0lnb1ZWYspAZEF7evrM4V+GJc/TQZshj597a7
 H//2RnRa+5/4i23O9vTmJXSEoc8KWVueUja7xRynivdNLJq8dTtuFRyAiZ8auJkPfi2t
 8VEYtPyFZEzzkQYkIxLBrfI4z/960dQtQP9AxqcNai5EQJ5bqv+wOG8wA4oFdhA9ljxg
 yHIYumTbhaM0W7UgDMK7LqGxvwwNpfWTa+mMeTCdbRUoNVV2IVIGX3F5vQsdW7xhk/vg
 UoGYAJMeei9LTTZ2uyvQOGF1tZ1Cux6ggxCt3RN66ynKoyXB22rVCtbR7s2G3AEO9ADT
 dIjw==
X-Gm-Message-State: APjAAAVGEPWAc6+G4FrCGsl8R+a7wUDzaemkwXRnTgCfBkQW6rOVRtSM
 uX2uttuGNp/XeZjzhnB9U6Cx/A==
X-Google-Smtp-Source: APXvYqwRurITgKIo+itQiVtkEYl8lwaBwfHF9UDrn9LsazOBHoyp2yHvdWaMSZPCsNTMsOCRYgzdAg==
X-Received: by 2002:aa7:8f03:: with SMTP id x3mr7447832pfr.91.1570057712526;
 Wed, 02 Oct 2019 16:08:32 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id o60sm307115pje.21.2019.10.02.16.08.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Oct 2019 16:08:31 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] riscv/boot: Fix possible memory leak
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: alistair23@gmail.com, palmer@sifive.com, bmeng.cn@gmail.com,
 peter.maydell@linaro.org
References: <4cba4d80e570372183b6685a26c72fa3e907bb51.1570051975.git.alistair.francis@wdc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <fe84f682-f38b-4587-09fc-10f95d813a43@linaro.org>
Date: Wed, 2 Oct 2019 16:08:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4cba4d80e570372183b6685a26c72fa3e907bb51.1570051975.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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
X-List-Received-Date: Wed, 02 Oct 2019 23:08:37 -0000

On 10/2/19 2:34 PM, Alistair Francis wrote:
> Coverity (CID 1405786) thinks that there is a possible memory leak as
> we don't guarentee that the memory allocatd from riscv_find_firmware()
> is freed. This is a false positive, but let's tidy up the code to fix
> the warning.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/boot.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

