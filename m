Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j1DLT-0007yR-5x
	for mharc-qemu-riscv@gnu.org; Mon, 10 Feb 2020 12:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57755)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1j1DLP-0007xx-NV
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 12:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1j1DLO-0005KP-Mj
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 12:59:39 -0500
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:41158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1j1DLN-0005JA-Od
 for qemu-riscv@nongnu.org; Mon, 10 Feb 2020 12:59:37 -0500
Received: by mail-pf1-x442.google.com with SMTP id j9so4065835pfa.8
 for <qemu-riscv@nongnu.org>; Mon, 10 Feb 2020 09:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=aHgzZrsrwcWeQ87VMrWjH4rMXOkj/mrqsMJ6vGEraG4=;
 b=vTwuFsXRyylgRKGarS+ot9yCdYqTChm7nPjrlyI3dcpgTLF6UgViuj0/epNyF8QYFy
 ha+damVOOgwrHRPkVOmTwrdH7NIDl92QvTV9NUCrWL0oBG4C4a9oxdMXJUkQXekhgsFe
 vrt3J/Hl5RNu79mwXJtxn+IsCeTaJb2d4wQqlx0zNNFRn5XM/6pSF4mHp01Fs2FbtPqu
 8cClocKFDbKi1m5Pf3nwBNduLXUkEdT1+Oc3zHpvhcb3L4W5ukl7wcfRyE/peFOIoM/Z
 Q2WbLT4nDaYTYlMD5J7x8bbjE5TDiC4gwv+le0/bYx8+jia2fU+zh0eYEzbx4OFv5zLQ
 DnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=aHgzZrsrwcWeQ87VMrWjH4rMXOkj/mrqsMJ6vGEraG4=;
 b=ioNHVafZcyhBCZ9kaPwjEvS8skcX0xanZF13aqGNyDZeKbug6OnysoAf9J2F1fy3Bc
 NxoHbZQio6i/ntdr1OPolIL8tAJVIRc885/Gk5iAp/9iQcanifieVjCNRxkeW3dv+Qrd
 gf7r/arBorSgnZEYKxew29jK2hP3Praqw4lQNyTf2mXJ5jGJhTbgh6/gcUlmhID4KvR8
 L9d2H7KQ1fiZbQeGNLs8sjaED48bktKwRf6kFkAV/iyYCvwBG9+/2LsS/k6um0vGJX3E
 xzWpsyPPY1aplH173llMiM7KYO9E6gfUZJDYuTIOJfbviIvAUlQe2NEfbASal1IO3HO/
 N2wg==
X-Gm-Message-State: APjAAAWm66614jFAuViskrg5V5kEK8Zsc7O/5b245YSQIHJzI2yKLJX9
 UJHJVdCnQbf7qFVRBQMrbtKSow==
X-Google-Smtp-Source: APXvYqzz7JxOl4/fuWUB8t5abHmZ1dcaoJ7fcrxkXF6ka3tgscWf0jYlxHx85/e3Vwc/VkfJ+0lhMg==
X-Received: by 2002:a63:2701:: with SMTP id n1mr2834110pgn.332.1581357576255; 
 Mon, 10 Feb 2020 09:59:36 -0800 (PST)
Received: from localhost (pat_11.qualcomm.com. [192.35.156.11])
 by smtp.gmail.com with ESMTPSA id h26sm1155458pfr.9.2020.02.10.09.59.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2020 09:59:35 -0800 (PST)
Date: Mon, 10 Feb 2020 09:59:35 -0800 (PST)
X-Google-Original-Date: Mon, 10 Feb 2020 07:10:57 PST (-0800)
Subject: Re: [PATCH] riscv: Separate FPU register size from core register size
 in gdbstub [v2]
In-Reply-To: <87sgjwr3sz.fsf@keithp.org>
CC: qemu-devel@nongnu.org, Alistair Francis <Alistair.Francis@wdc.com>,
 sagark@eecs.berkeley.edu, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: keithp@keithp.com
Message-ID: <mhng-640eeb10-fc1a-41fd-b870-5f76e8fcdab4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
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
X-List-Received-Date: Mon, 10 Feb 2020 17:59:40 -0000

On Thu, 30 Jan 2020 14:13:16 PST (-0800), keithp@keithp.com wrote:
> Palmer Dabbelt <palmerdabbelt@google.com> writes:
>
>> This isn't working for me.  When I apply it on top of my for-master (which is
>> very close to master), I get 
>
>>     warning: while parsing target description (at line 1): Could not load XML document "riscv-64bit-fpu.xml"
>
> If you're building from an existing directory, I think you'll have to
> force re-creation of riscv32-softmmu/gdbstub-xml.c

That worked, thanks.  It's in the queue, with a note in case I forget again :)

>
> -- 
> -keith

