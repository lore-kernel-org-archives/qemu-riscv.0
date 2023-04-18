Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pofyx-0004by-8D
	for mharc-qemu-riscv@gnu.org; Tue, 18 Apr 2023 03:42:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofyv-0004bc-My
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:42:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pofyu-0006f8-2n
 for qemu-riscv@nongnu.org; Tue, 18 Apr 2023 03:42:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681803746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cuf0qr0j1Ibb+rzsHEXe0ggA9qprGn2UiYOR7P2RdWM=;
 b=FmFKV0tP5gg29Xr44QER8uxHuFxfOXAvu6fzUNrOR8PBpmqgfVXry8PWyzIQ+ERrqTdmfS
 +hjVruAzyin0ZcmL3jJUUuabbSlR1RfuAmA6SaPQBknK2QMXx8UDjrJ30LoKF1OYxDLpJb
 thEga+hQHnsjy0ZhIeceO2V91KnhA9w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-_J6Wz_fDM2--mzng7zS8fQ-1; Tue, 18 Apr 2023 03:42:25 -0400
X-MC-Unique: _J6Wz_fDM2--mzng7zS8fQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f1763fac8bso5921195e9.1
 for <qemu-riscv@nongnu.org>; Tue, 18 Apr 2023 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681803744; x=1684395744;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cuf0qr0j1Ibb+rzsHEXe0ggA9qprGn2UiYOR7P2RdWM=;
 b=fIHIs0b/8LFXDd3Ayzu0XZY2s3jcmsqqo83Gzc2nFBaAJW6WfW1CGLT4X1CQfDdg0w
 sdR9v/IKgjP0D5zrR1EYvGQ/D2iYTQbyLHub4qQK6k6InD6xOxCKhQLRgKzAHuQCfuBy
 KNKWVKkG61fbslqTDQqUwybDnyfY7XzTVs+5Hfynb+8GMLQJvqUKC7nvkrFqll1F1E6o
 LHMlsIrrjRQnVvMJ9yVr9Ac5226CCvHyHdNTtIJKnbGzo5AkfaLBUh8jmBFXaLzcEOO9
 wn1UBaOqmwPr/fwai0356VBr3WFzOz7LyGDhn5XZn31Gy+iJZ6WYc46uL4H4tK1Lp2aX
 25Ig==
X-Gm-Message-State: AAQBX9eBu96ME7vEh6cLUMNc7aP4IjsMvZbt/nQJ98kC9z7lReq1A1OR
 vlA4o6cNthpQ4WjJHws4baKowzkBXG6ycJ7bDoP7G4hhD91Ruxw6+WoWZKMYbT7PtSgyBK1tBae
 GL11Z0uE3NfhBQxk=
X-Received: by 2002:a5d:4fc6:0:b0:2fb:4121:285a with SMTP id
 h6-20020a5d4fc6000000b002fb4121285amr1000131wrw.57.1681803744285; 
 Tue, 18 Apr 2023 00:42:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350bk6BxLLGcYf6rfZgFGY9KqFWrQEvs3L0KKLPbQ+Tbn6xQASd4SsrFM4KkCbx32E5FLlb3guw==
X-Received: by 2002:a5d:4fc6:0:b0:2fb:4121:285a with SMTP id
 h6-20020a5d4fc6000000b002fb4121285amr1000117wrw.57.1681803744027; 
 Tue, 18 Apr 2023 00:42:24 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-176-59.web.vodafone.de.
 [109.43.176.59]) by smtp.gmail.com with ESMTPSA id
 l6-20020adfe586000000b002fe065da369sm271424wrm.69.2023.04.18.00.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Apr 2023 00:42:23 -0700 (PDT)
Message-ID: <3aab7cc1-c068-da71-13bc-58f7dd164bfb@redhat.com>
Date: Tue, 18 Apr 2023 09:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: How to increase memory in a RISCV32 image? Stuck with 988MB
To: "Mikhail R. Gadelha" <mikhail.ramalho@gmail.com>, qemu-discuss@nongnu.org
References: <CAORA-9bu70APxEC4w+Ona9dzTN9Wy9kmPzEQAgxOQ6u6eK71ug@mail.gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAORA-9bu70APxEC4w+Ona9dzTN9Wy9kmPzEQAgxOQ6u6eK71ug@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.284, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-riscv>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
 <mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Apr 2023 07:42:29 -0000

On 17/04/2023 19.21, Mikhail R. Gadelha wrote:
> Hi qemu folks,
> 
> I'm using yocto to generate a riscv32 image but qemu seems to be ignoring 
> the -m argument from the command line and forcing the image to run with 
> 988MB of RAM.
> 
> Is there any way I can increase it to 4G?
> 
> I'm using the following cmdline to start qemu:
> 
> qemu-system-riscv32 -nographic -machine virt -m 4G -smp 8 -bios 
> /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/fw_jump.elf 
> -kernel /home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/Image 
> -append "root=/dev/vda rw mem=4G" -drive 

That "mem=4G" part of the -append option looks suspicious ... have you 
already tried to boot without that, or to decrease it to a number that fits 
into 32-bit, e.g. "mem=3G" ?

  HTH,
   Thomas

> id=disk0,file=/home/mgadelha/tools/poky/build/tmp/deploy/images/qemuriscv32/core-image-full-cmdline-qemuriscv32-20230415202008.rootfs.ext4,if=none,format=raw -device virtio-net-device,netdev=usernet -netdev user,id=usernet,hostfwd=tcp::22222-:22 -device virtio-blk-device,drive=disk0 -object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0 -device virtio-tablet-pci -device virtio-keyboard-pci
> 
> Well, it actually doesn't start if I use -m 4G, but any value lower than 
> that is fine.
> 
> Here's also the boot log: https://pastebin.com/b7ZEP659 
> <https://pastebin.com/b7ZEP659>
> 
> I see that the kernel prints:
> 
> [    0.000000] Memory limited to 1024MB
> 
> so maybe it's a kernel limitation rather than qemu?
> 
> -- 
> 
> Mikhail Ramalho.


