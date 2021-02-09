Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9OwC-0007B1-B2
	for mharc-qemu-riscv@gnu.org; Tue, 09 Feb 2021 04:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Ow6-00078v-54; Tue, 09 Feb 2021 04:03:54 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Ovr-0000ZT-63; Tue, 09 Feb 2021 04:03:53 -0500
Received: by mail-ej1-x62c.google.com with SMTP id w1so29990795ejf.11;
 Tue, 09 Feb 2021 01:03:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JCIiBSYHagxC/fBqwlJWxobyinW0byYmnh/jHNtho7Y=;
 b=qnvgqNODn/MjC+ieAK08YJe5jFOGd/cX3+G7hXhCcnSOdT2jQir6lryb/+uZOpb12X
 2IhNOIWhkTfu52/hWPUcBlO7qtnYDG7JqrABgFtEA0QN/5w8H+ro/EPGQYA4T2Girjai
 EP1sK/KFWvfIYQR3ptxx7BvH8Pc3HIIRQHIeo535hIPuwS7GIvUjk/emko7eYPt4tnMq
 BS0Tnc4aZl6bOAnfVWnC7fh7BMp2I9OnFyrASVuVVkfYZqoKdyiPE2rvwTIooFMxxomK
 jAGOe5cSt70QN0bnYtpY/HtwNdbnau5tIL/py+i4zOXaOJeWooFgg3cGOFJF2GYky5lz
 EL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JCIiBSYHagxC/fBqwlJWxobyinW0byYmnh/jHNtho7Y=;
 b=qwhRC2F7oAlGdDtFwI9Kltju2lYbwIO2f2wPGPfEGdYNIP2mLw+HT7NGSMAY2Fqg2K
 ViBnXFhsVkAYsPnJmP1r5ekycNIXN9R2lV+urtpExyVa8HlGG2tuEhh1xBxFZePleR22
 4XcSfkw81fXU395uymoqpLzuqJgU0hmNfbqNqF3idAjlVBAEZII6aouCjJh34z2F3dMD
 rspVJ24et0YN5gXaZbv/UvO28fuDL6fyKy8np2hl45f43RiWjrOq9rzBvcWrj6OexWQw
 Ub2VtiS0aJ6mtbsWHv0pqSbFuelIrCKw/WjEbeBb3IMG9VzrgDq6vW8lGkVLTtIx28S1
 lxjQ==
X-Gm-Message-State: AOAM533232uZkSU9u2PZm8wdYj8PtvZRTVLBsZjN+4+g+mUsgXiAV59/
 T9yt5xTo0zk8OfSFGggeKVY=
X-Google-Smtp-Source: ABdhPJxk6smrvIEShybT5yfndmuVlr2rzkmB21B7//wLcL4vNOE/iomfXayVEhysp+07L5d8fFeysQ==
X-Received: by 2002:a17:906:b001:: with SMTP id
 v1mr21210807ejy.217.1612861416865; 
 Tue, 09 Feb 2021 01:03:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q2sm11095282edv.93.2021.02.09.01.03.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 01:03:36 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v1 1/1] MAINTAINERS: Add a SiFIve machine section
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair23@gmail.com>
References: <6bc077e5ae4a9512c8adf81ae194718f2f17c402.1612836645.git.alistair.francis@wdc.com>
 <CAEUhbmW5TzWVQFOv3PM6ZwY34cSPRjvfzN3sWxP+_6SDcJ93ZA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <81d9407d-94b3-724c-d64f-0829553abfdc@amsat.org>
Date: Tue, 9 Feb 2021 10:03:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW5TzWVQFOv3PM6ZwY34cSPRjvfzN3sWxP+_6SDcJ93ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 09 Feb 2021 09:03:56 -0000

On 2/9/21 3:14 AM, Bin Meng wrote:
> On Tue, Feb 9, 2021 at 10:11 AM Alistair Francis
> <alistair.francis@wdc.com> wrote:
> 
> nits: SiFIve => SiFive in the title

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

