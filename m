Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ium09-0008HP-3f
	for mharc-qemu-riscv@gnu.org; Thu, 23 Jan 2020 18:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ium06-0008H9-Mj
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 18:35:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ium05-0001iX-KP
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 18:35:02 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46186)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ium05-0001gC-Cc
 for qemu-riscv@nongnu.org; Thu, 23 Jan 2020 18:35:01 -0500
Received: by mail-pl1-x644.google.com with SMTP id y8so2021310pll.13
 for <qemu-riscv@nongnu.org>; Thu, 23 Jan 2020 15:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tt6ehp+Xt0YHdAnahiF95kNQWd8dbzh7qju1RrRwJPI=;
 b=q0XfNlXlOIj2YOncttfvXZcBL/NytBRTBs62CHugdvn4Giey2sTnqrKNq9lM9hj868
 e4n31lEcl/WUX3uedLXr6Nx/Znb1VE0kiXW3WypgsgOFUgLecepfT5pkvAKerudaELSL
 ExEKz/XyMx6yHbXHPUUYHUzPl/1rPtP9yJy7tgQ8RQV+EmMHkvdWvHZh1q1QypOmOFgB
 exy0xcZazqMy2yCxUjwDxYSVcS1p5IXbf5saFjDsy7rZ0xa62WgqXiFj9CQ70b2SnJi7
 ypKVnlu3sUO8O5QFg3U9uvNHmplwjrEVgSOkj8aBhPkCvJ+88XbEG5qQo4/GIpYNFAwt
 QNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tt6ehp+Xt0YHdAnahiF95kNQWd8dbzh7qju1RrRwJPI=;
 b=VQb3fmH0J2r/GOetgSwJW87k+R0B+HDy/fxFFtgiLdUdGMLkRAodc+ePQsko0zzg/G
 go0Rp3NTDclMUTMDVTgW33maoDic9vFXWxrSZkr2/h+fulMBy+Dxyj6+U4TiQNuIDFNP
 F6GowCP4nzMKi+yz7Espj8S0T7lLL2EDj5yye+Rg9eeKeH6F3gpY8HUmcJionLlkT6Jb
 iq/DmwsXsre74/ln4yv413MqorROQfJC+hDLNS1cLZ8c3QcLtKhbO0G5KEaiuGj1mw5D
 RdZBfQuwJi2TGhuMUax3M27vbVgNQJltGU3bip8RGlYCL1nUtMtXxvK+fDlM7P91+5yt
 VH1A==
X-Gm-Message-State: APjAAAW9eThfj181CczFejo8hhfyBz9l9WvLVyCWzHgqgYhkC2HGWetJ
 zI8sMsQIxdjZCynVk27ldNAw2Q==
X-Google-Smtp-Source: APXvYqxAXt1PTx0kJ62pguqQ/zezQs3hfZZkh+hdc/MoiMyIzcuEM7IffbiQvd+WUyGpy5mcGtVUSQ==
X-Received: by 2002:a17:90a:3aaf:: with SMTP id b44mr156666pjc.9.1579822499882; 
 Thu, 23 Jan 2020 15:34:59 -0800 (PST)
Received: from [10.5.50.117] (rrcs-173-198-77-92.west.biz.rr.com.
 [173.198.77.92])
 by smtp.gmail.com with ESMTPSA id m14sm4133081pjf.3.2020.01.23.15.34.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jan 2020 15:34:59 -0800 (PST)
Subject: Re: [PATCH] target/riscv: Disallow WFI instruction from U-mode
To: Jonathan Behrens <jonathan@fintelia.io>
Cc: Palmer Dabbelt <palmer@sifive.com>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
References: <20200123195200.206355-1-jonathan@fintelia.io>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5d74dfd1-f1f5-df3d-e0b1-771781497553@linaro.org>
Date: Thu, 23 Jan 2020 13:34:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123195200.206355-1-jonathan@fintelia.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-List-Received-Date: Thu, 23 Jan 2020 23:35:03 -0000

On 1/23/20 9:52 AM, Jonathan Behrens wrote:
> +    if (!(env->priv >= PRV_S) ||

For integers, !(x >= y) is a poor way to write x < y.


r~

