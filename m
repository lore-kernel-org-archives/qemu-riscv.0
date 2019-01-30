Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gov7O-0004NL-Cg
	for mharc-qemu-riscv@gnu.org; Wed, 30 Jan 2019 14:01:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gov7L-0004Lk-MU
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 14:01:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gov7K-0001nV-L9
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 14:01:47 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38546)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gov7K-0001gk-E4
	for qemu-riscv@nongnu.org; Wed, 30 Jan 2019 14:01:46 -0500
Received: by mail-pg1-x52b.google.com with SMTP id g189so223687pgc.5
	for <qemu-riscv@nongnu.org>; Wed, 30 Jan 2019 11:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=I2fOAZa9wHxYpeG2BzE0eRvXNTPzxGs9IC3RYIBQ514=;
	b=ciiXaMoL20ZzodoLymi3AyHdpb9pMmZxqbsD4j456NmCh6Txq8UFc1nkdgGUBfD3xV
	T6uv1a4kPQvVGy2spYvEhI10iTqGg+Sx68lyu0+b0SCiXI02udv2BlqAVNudGNpEXmMg
	8zX5ukAJqhjmzMPxu5N7JX7pJt8oEP10iLmXRQUC4Hk+EQGK48TW6LHtCKF1q9xFeC14
	4YhKIChWIpu2yOinmVSualOgXWqKNtgQuRAaNXu5+69pJqGd+RyBjUDHi3vMTQCNkMTX
	K7xjmJvqERn2aXzZ/aaji+KeUqwgs+wpxqTIita6Z5Ip1VC/q6OE8NpjykfWIWmtO6mD
	JCIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=I2fOAZa9wHxYpeG2BzE0eRvXNTPzxGs9IC3RYIBQ514=;
	b=LNaRRvHXfpNW/Csf9fYwIb34sV3ohXeaqfCOXgAmxG67JompskSh+94dFMSpl9wsxW
	UwdfKkzK/CV0CVU8j+CiiK3ZNGHPhzsOd6RHrPr9Su9CduYe2Fgj6rCcCooDfUnPwNk/
	08w/sU3T7NQru0kkrWea/JhpstyPAmz09OFWAwricdJ/7yQ351mLrjiY0Fi903SgACJN
	YVnCfROSKtvXcSW7QFXDANdEwWKX0iNDDn1pOZbZi6ID+grbyT4TSQ3iLr/fnLrOkghd
	3jnh7JGkZNJTwK8G8+QRDl866SSDUghYb1AzvqOVRCxxPxnI3m7lBao7fBM2jHeoRXXj
	uyVg==
X-Gm-Message-State: AJcUukcw/sLfwq5JQdK4Y2O7q+DL17JFKAk2GdlKtGDPEMECM3DNAZZo
	BzWfhsPiDR4XEuN5M5KcaoTQgRbZBIE=
X-Google-Smtp-Source: ALg8bN7ZPRo0gRw8Km29g04WMfn1yD21PV/69SwnD5r8fK+nBTU5xi5s/uK3EYD4KmwxqyD9q2KWXw==
X-Received: by 2002:a62:53c5:: with SMTP id
	h188mr31135586pfb.190.1548874889916; 
	Wed, 30 Jan 2019 11:01:29 -0800 (PST)
Received: from localhost ([12.206.222.5])
	by smtp.gmail.com with ESMTPSA id r4sm9973858pgn.54.2019.01.30.11.01.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 11:01:29 -0800 (PST)
Date: Wed, 30 Jan 2019 11:01:29 -0800 (PST)
X-Google-Original-Date: Wed, 30 Jan 2019 11:01:03 PST (-0800)
In-Reply-To: <b9b988df-140e-108d-a80d-48c7ce1b351d@redhat.com>
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmer@sifive.com>
To: eblake@redhat.com
Message-ID: <mhng-a324878c-b61d-4d8d-80bf-e15404469ef7@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: Re: [Qemu-riscv] [Qemu-devel] [PR RFC] RISC-V Patches for 3.2,
 Part 3
X-BeenThere: qemu-riscv@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-riscv.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-riscv/>
List-Post: <mailto:qemu-riscv@nongnu.org>
List-Help: <mailto:qemu-riscv-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-riscv>,
	<mailto:qemu-riscv-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 19:01:49 -0000

On Wed, 30 Jan 2019 09:45:33 PST (-0800), eblake@redhat.com wrote:
> On 1/30/19 11:35 AM, Palmer Dabbelt wrote:
>> The following changes since commit 5385a5988c8a55bebdc878c05b96648579b5d6e0:
>>
>>   hw/virtio/virtio-balloon: zero-initialize the virtio_balloon_config struct (2019-01-21 17:20:36 +0000)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/palmer-dabbelt/qemu.git tags/riscv-for-master-3.2-part3
>>
>> for you to fetch changes up to 461ab9de46d085a37b0da6f096aadc4e0dda4d4c:
>>
>>   target/riscv: fix counter-enable checks in ctr() (2019-01-29 11:33:38 -0800)
>>
>> ----------------------------------------------------------------
>> RISC-V Patches for 3.2, Part 3
>
> There is no 3.2 release; the next release is named 4.0.  However, if you
> don't want to bother with sending a v2 pull request just to fix the
> merge commit message, that's okay with me.

Ah, sorry.  I think I'm just going to leave it as is, I'll get it right next 
time.

