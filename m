Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mIBlF-0004VO-PI
	for mharc-qemu-riscv@gnu.org; Mon, 23 Aug 2021 11:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBlD-0004PL-PB
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:21:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIBlA-0002aG-Jl
 for qemu-riscv@nongnu.org; Mon, 23 Aug 2021 11:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629732071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
 b=YduXYmiJ/iEMz2Hn7oo9fmvF6ioB8IR81JuXjshQh+fokfRAq2x9EHjGQHiLwMLB81015e
 j/9PAaBk+5xhGTy56gNEUg5DIATHd/ylWZdduUhxh1tZWT2GQhUMolCuf8neu8P+BZy+zu
 FiWwQs8+VqymS+zQRtfCoHd4R9nG8eY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-mtiOAdEbMie8uOY1avo5Pg-1; Mon, 23 Aug 2021 11:21:10 -0400
X-MC-Unique: mtiOAdEbMie8uOY1avo5Pg-1
Received: by mail-wm1-f70.google.com with SMTP id
 i204-20020a1c22d5000000b002e74466ad9bso2754532wmi.4
 for <qemu-riscv@nongnu.org>; Mon, 23 Aug 2021 08:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cpJihCXUzgpi+3OL+/LebXO+XMRlBWHGbhTpOkTFKxg=;
 b=dCx0gXpAcELiwZX0u7PnVBnyo4FKc+/S/nm77Nayln6tDdnndk7a7yHIib8ZmRUcsH
 BXzGz0VIzr06bxyRjxJ23sd/QJQsKhk1PhEk+NCfZVbjE4FEcKP4/zvRDexygZIA99F6
 xC8kBgHnL7lO9a0rlikTivRFplTLRIV21HF3YScwTgZ9Uf7kJFOsrogcaQ+jC/BBu3Wd
 h423jK/LAMes9t/3LFypyk1dyXeUhzGPbi5resrvObkftAxhcG/kI24cBl8+UOJguQSA
 BE4SfF6R4IRkSKvfsQMn7YYLh8SQHAh8RfgF5kXXqsBqoBgLNTjXvnZZ4xwBrpeHrwXK
 5fNQ==
X-Gm-Message-State: AOAM533ROXu9zeTRkMdXsFHZfPt8Pl6fAiuOOfAStYOmyVKXw0orc5EA
 izk1YTRiC8iMKOYcGzHrXlxrrbZFdUNv+sjOhhSs5I4xyCn8B0wXKRVD6JXh7RO76AWpFhABLsI
 trc6o6YavBdHuL1HjgsXAa3NQZGQJNHORT/QrZjYaCdnuFRfvmOoGmQAvH/bLujvd
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828918wmc.41.1629732068832; 
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyBwDeP4M+7EFA4baaz9ImETe8Ln71jNQE/wsj9Q80a1drPkKy5pEICXfi8ZQ2OnjEt2LoJaA==
X-Received: by 2002:a7b:c04b:: with SMTP id u11mr16828884wmc.41.1629732068569; 
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id n15sm7575253wmq.7.2021.08.23.08.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 08:21:08 -0700 (PDT)
Subject: Re: [PATCH 0/3] gdbstub: add support for switchable endianness
To: Changbin Du <changbin.du@gmail.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20210823142004.17935-1-changbin.du@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7523c6ad-52cd-0b20-b09d-01bd537edbb3@redhat.com>
Date: Mon, 23 Aug 2021 17:21:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823142004.17935-1-changbin.du@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 23 Aug 2021 15:21:16 -0000

On 8/23/21 4:20 PM, Changbin Du wrote:
> To resolve the issue to debug switchable targets, this serias introduces
> basic infrastructure for gdbstub and enable support for ARM and RISC-V
> targets.
> 
> For example, now there is no problem to debug an big-enadian aarch64 target
> on x86 host.
> 
>   $ qemu-system-aarch64 -gdb tcp::1234,endianness=big ...

I don't understand why you need all that.
Maybe you aren't using gdb-multiarch?

You can install it or start it via QEMU Debian Docker image:

$ docker run -it --rm -v /tmp:/tmp -u $UID --network=host \
  registry.gitlab.com/qemu-project/qemu/qemu/debian10 \
  gdb-multiarch -q \
    --ex 'set architecture aarch64' \
    --ex 'set endian big'
The target architecture is assumed to be aarch64
The target is assumed to be big endian
(gdb) target remote 172.17.0.1:1234
(gdb)


