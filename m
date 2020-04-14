Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jOCdy-0006iB-Fp
	for mharc-qemu-riscv@gnu.org; Mon, 13 Apr 2020 23:53:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <anup@brainfault.org>) id 1jOCdw-0006i4-Q8
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 23:53:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <anup@brainfault.org>) id 1jOCdw-0000l4-0F
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 23:53:48 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:50224)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <anup@brainfault.org>) id 1jOCdv-0000kM-K2
 for qemu-riscv@nongnu.org; Mon, 13 Apr 2020 23:53:47 -0400
Received: by mail-wm1-x336.google.com with SMTP id x25so11499465wmc.0
 for <qemu-riscv@nongnu.org>; Mon, 13 Apr 2020 20:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FDYRxaPDjo7A545caXT5dQgBQnmG0mpt+y1hUTQMkt4=;
 b=ulgxfQj9ttiesunoqggzjRqfhVYUP8vUKWMx7G4sOnOF6XyaXRrjYr270Y9xWNS5Bh
 H7awXGQePL6S3vvC2xoHrHQL7edwLQe2Y5Rlprg4tAZmNM06qEQNAC988CvnFUWJtiSd
 cIITMZrTw6GNaB2B4FnPbF9QdWMqno2qAriU4E90lJjwdJSp8z8ghAuRJBDGdDuaxMXi
 Qo4zpV3zvf8f4R2KJKojZoi+BkkOIZxP4GWyY41seEx5TPCVWa/5/G3EqYiXG4MFdsCi
 HC2iAhxf4DHVSGx7ozKRMjugNLPdbaLlQm9HllseehCNNUNUrOK35brr5AVoCZN0+uB+
 1LFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FDYRxaPDjo7A545caXT5dQgBQnmG0mpt+y1hUTQMkt4=;
 b=R3r1rEk0XmrN9cl1MW5AeJDVF55SrisVQ27jHjNYeWLBJgh0OyaaoBX5dqTjjVi9l0
 FisM0pPi60vmVpheT1BtwgJgNxIzAw0kA4LrzvHGLMPXLv5vCwDxBHWnvv4TEw/rm+Cd
 J8RuFDVgTHoyCr2CBZY9M0oVzCUd+7Rv1mKjMSdtMDiPzXjTFTpmfnJeXl/vTI0EegnC
 nF4H+EXpRej084EahMYeU+QLj3l1DMipHpe2mpnHmeHe1CURsOGXIa5/2FmHeWr6t4oE
 xoWfWXXtIgOXpDB3nN0KGppZichYAzQmN9m/avL8OeMakwNFRa92FjloA1NQtlVSlDJ5
 rI2A==
X-Gm-Message-State: AGi0PuZpYLRBcJCVN4y4j/QZe+GKZP7K+yPJtrQmZ1c3eDGnEVCAXSA7
 /GKubUGwkxLsxl0YbHENltUCoSSGOb1akGOfoT+MOg==
X-Google-Smtp-Source: APiQypIhaANxdDHfag+9KNyk+sZZlvwAfCJ1ximwEaeleObV1+KuyQlqQ7/as3jl0b8vR9gd1NN8NrMls2ovV9PVDQ8=
X-Received: by 2002:a1c:9d0d:: with SMTP id g13mr17569203wme.102.1586836426025; 
 Mon, 13 Apr 2020 20:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo1YDkehHariEcUJh13oYf1dx_QVBSj2Frr=kYK_Lsqkzw@mail.gmail.com>
In-Reply-To: <CAC41xo1YDkehHariEcUJh13oYf1dx_QVBSj2Frr=kYK_Lsqkzw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 14 Apr 2020 09:23:33 +0530
Message-ID: <CAAhSdy0+zXrkPekin5pxDD0xbYSCOHj+VhTJyM1oZUqWtc9UHg@mail.gmail.com>
Subject: Re: hyp v0.6 work?
To: Jose Martins <josemartins90@gmail.com>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::336
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
X-List-Received-Date: Tue, 14 Apr 2020 03:53:50 -0000

On Mon, Apr 13, 2020 at 9:01 PM Jose Martins <josemartins90@gmail.com> wrote:
>
> hey guys, I'd like to know if there is any ongoing work on the latest
> version of the hypervisor spec (v0.6) and if there is any scheduled
> timeline regarding its implementation or timeframe for when v0.6
> support to be available?

Yes, it is work-in-progress. stay tuned ...

Regards,
Anup

