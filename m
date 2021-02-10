Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l9w6L-0001F5-KD
	for mharc-qemu-riscv@gnu.org; Wed, 10 Feb 2021 15:28:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9w6H-0001Du-EI
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 15:28:37 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1l9w6E-0003eW-25
 for qemu-riscv@nongnu.org; Wed, 10 Feb 2021 15:28:37 -0500
Received: by mail-pl1-x630.google.com with SMTP id g3so1873512plp.2
 for <qemu-riscv@nongnu.org>; Wed, 10 Feb 2021 12:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=eTLfhMK7Whv15Xb1D4kMwvVf+zYnCuWa60Gf+MoWbjA=;
 b=OXH8/WmXfBbi82UQsEwO9zIdKsYKKVgjHmAEkt2oguwxrmIoz70mXbiDOJJLJwFM4K
 PtdUPQ0n6xEj10ZYY7w0rM1gjIpB1M9BdABuoU0icjQc6ylhTY9PoRIx+d4RifAkV48g
 6s4vE1pvgmh3DTe0OYZqEAUxREK1BWNgrVQgOGgZzKwCZrrKbXRzJAMvZD1NbtKgvpxc
 m4qJyhgZBrbqeKXvfcDE0yX1gL/SYwmmrgLU/JxtRTbFqX52mTBG5323OFtb0kO2SkQS
 6e2QtGtZwWgbucKW5pqpTBcJeQWVn8HUXvVwAkICXNkESNweqPkw98g+fvxURRchQbo6
 0miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=eTLfhMK7Whv15Xb1D4kMwvVf+zYnCuWa60Gf+MoWbjA=;
 b=SNPnUrjJpDDZSYygq+BKmrkY6yx9pgCOmmTo1DZilipvi0SoGLfvtks4dNlA68HFuI
 +oqoCacfaH/IsZBOYqo5mqeZl3Z1CxSLGlqFqi4iG/HeaDy8soIN/s50YzhSgd7p6DKT
 /x43YlM/3ACShqdbFmuBRk9nfLgCY7kdlcXuyIR8EFoxpKkMH300Ph2LCMHTWVd2cOYy
 xIempjM2Rpu3wnL/9Ne0j0pMqzqQEx7Rh3tJ6161GnfHG/89xGD2aGa/SpEJ5MwqzTy7
 x/w/k8I3Z3jXng3gxkfUeTLwwhLFSaKSkkYPybc9i9jEZbYOOel+b6DIIsBfFqCYrey4
 uRcA==
X-Gm-Message-State: AOAM5331WmNcYEZRyrf5yhnmE6UyTlIJ/I9xldWehD+RHEFemgvsIPOW
 NWtgAtPhj0Umcx2blWUDIfnbR5cu7mr0PZxx
X-Google-Smtp-Source: ABdhPJz6ypkXSvwpmdnjIl13oPZwxiwK4kae3HDWFY/hqhDrNHrAPnafrxHgwUnrpBbDOOfV/s+NOA==
X-Received: by 2002:a17:90a:9e3:: with SMTP id 90mr679445pjo.66.1612988910146; 
 Wed, 10 Feb 2021 12:28:30 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id k69sm3287660pfd.4.2021.02.10.12.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 12:28:29 -0800 (PST)
Date: Wed, 10 Feb 2021 12:28:29 -0800 (PST)
X-Google-Original-Date: Wed, 10 Feb 2021 12:28:24 PST (-0800)
Subject: Re: qemu support for rv64imafd/rv64imafdc
In-Reply-To: <CAKBF_5qGScpAzeaJKHs4102nqVCmjmNq05EXLHLbLPV9tXBd9g@mail.gmail.com>
CC: qemu-riscv@nongnu.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: billa.iitmadras@gmail.com
Message-ID: <mhng-1181297c-6676-455c-af50-9c947b9a470d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=palmer@dabbelt.com; helo=mail-pl1-x630.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 10 Feb 2021 20:28:37 -0000

On Wed, 10 Feb 2021 02:10:35 PST (-0800), billa.iitmadras@gmail.com wrote:
> Does riscv qemu support  both kernel image generated with RV64IMAFD
> extensions and Image generated with RV64IMAFDC ?. If the answer is yes, how
> is it supporting both ?. Please reply to my question if anyone knows.

You can use CPU properties to enable/disable various ISA subsets.  Something like

    qemu-system-riscv64 -cpu rv64,c=off

would turn C off.  The other supported ISA subsets can be enabled/disabled in a
similar fashion, including everything you listed.  There's no known reason
RV64G (ie, non-C) kernels wouldn't work but they're not widely used so you may
run into some long-tail issues.  You need C for EFI, but most people aren't
using that on RISC-V yet.

