Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mdBEm-0007MP-De
	for mharc-qemu-riscv@gnu.org; Wed, 20 Oct 2021 09:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBEX-0007JP-63
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 09:02:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mdBER-0002tV-3r
 for qemu-riscv@nongnu.org; Wed, 20 Oct 2021 09:02:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634734930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UdnLekge+Tlk8zswJQagBB+tImfydaqEw6Br932jXcA=;
 b=CVjOJ1nwzsooWQE/mWVkOBNtOa1Z6gx0U0nPdTP94I/5Tse5070mGJEnfg0fOnmBnAEyDw
 jPNzx07ZhTY21/ZpNtLkgFvzsBLbKY0Md2GvH6bZ2QHMcZJSDenSywt5yfLwKJQ+B2pE8k
 OqvWFYEfaBoDlkW+hPdke+8CpiIU/dM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460--_VKN3O0Pr-OQKAyoPpIIw-1; Wed, 20 Oct 2021 09:02:08 -0400
X-MC-Unique: -_VKN3O0Pr-OQKAyoPpIIw-1
Received: by mail-wm1-f69.google.com with SMTP id
 o140-20020a1ca592000000b0030d66991388so288129wme.7
 for <qemu-riscv@nongnu.org>; Wed, 20 Oct 2021 06:02:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UdnLekge+Tlk8zswJQagBB+tImfydaqEw6Br932jXcA=;
 b=8OZSFgNna5AapzSnLVt66uEqRAbO3X15BxBHNafSPfLObBxocarhm/2BZuBTDAEo9L
 /i+GFQdwkBZhMb6J3ecasxeOGcplGiNLxcq1enMv6yl7lgwUMFEhcXRNhBrqMHPPkUSP
 66hxeCSee3J2oyMv3EBjRaxYWUVd0yM8ZkxkvHuRepvvY0TUZUdhsys6HEbhV/BN2gwO
 NPSYl9qmkwHmMJ9oenpF8tENLZV6557PzlyQ1JLk7jRW53P65bUcc1DaaGZtmO1q0q0f
 G5OunETwn07yKYjdoOLWx/3FZrr5uwGg4qqdod+AlXuuWJHBJoU1W7N4R8PM4KgDX/vF
 tX5g==
X-Gm-Message-State: AOAM533cWxeDDawmpV0YYhy76trR3YYYFz78ZI0tv1M3NjxGLZgn1rZ6
 PZgVaq/UlQZNBU+rmvBKoeXTIU1MvbgpDlovJzOx0Jir9PPWpJmzv9q0L+5B3ICr2YU6SfOwAl/
 GbESjpSEESxB+Ki0=
X-Received: by 2002:adf:a48e:: with SMTP id g14mr52185837wrb.11.1634734921407; 
 Wed, 20 Oct 2021 06:02:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJEyzj9BBz5RvBxpsx0N5y0dtORfXVBikXHq0ZyUqRsHKjRrFslJh17qQdgCr8KNiZjhLFLA==
X-Received: by 2002:adf:a48e:: with SMTP id g14mr52185779wrb.11.1634734920979; 
 Wed, 20 Oct 2021 06:02:00 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id g3sm2257371wri.45.2021.10.20.06.01.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 06:02:00 -0700 (PDT)
Message-ID: <f2922591-0335-b319-a3df-4b0a95b4e5fb@redhat.com>
Date: Wed, 20 Oct 2021 15:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 2/6] hw/riscv: opentitan: Use MachineState::ram and
 MachineClass::default_ram_id
To: Bin Meng <bmeng.cn@gmail.com>, Alistair Francis
 <alistair.francis@wdc.com>, qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>
References: <20211020014112.7336-1-bmeng.cn@gmail.com>
 <20211020014112.7336-3-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211020014112.7336-3-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
X-List-Received-Date: Wed, 20 Oct 2021 13:02:24 -0000

On 10/20/21 03:41, Bin Meng wrote:
> Using memory_region_init_ram(), which can't possibly handle vhost-user,
> and can't work as expected with '-numa node,memdev' options.
> 
> Use MachineState::ram instead of manually initializing RAM memory
> region, as well as by providing MachineClass::default_ram_id to
> opt in to memdev scheme.
> 
> While at it add check for user supplied RAM size and error out if it
> mismatches board expected value.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> ---
> 
> Changes in v2:
> - add RAM size check
> - assign mc->default_ram_size
> 
>  hw/riscv/opentitan.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


