Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRMML-0003OE-HQ
	for mharc-qemu-riscv@gnu.org; Mon, 26 Nov 2018 14:15:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMMK-0003N0-34
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:15:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <palmer@sifive.com>) id 1gRMME-0007pT-HR
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:15:50 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:45391)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <palmer@sifive.com>) id 1gRMMC-0007cd-JG
	for qemu-riscv@nongnu.org; Mon, 26 Nov 2018 14:15:46 -0500
Received: by mail-pf1-x441.google.com with SMTP id g62so7035362pfd.12
	for <qemu-riscv@nongnu.org>; Mon, 26 Nov 2018 11:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
	:content-transfer-encoding;
	bh=qXttEqXX+xILch0cIH/x0SGUTmIlW1fuQh5QlqRLH7I=;
	b=Sm6AQJLPmbVqs5UB/8hpNgELQ4bQSzOzcrxXI8bQlFgOpgw/YfMiuYJv5TW0KvhdJv
	hOIno6SESBGcaeFRzhZ62iEoDNdjqOp2ZyRnFObrmpYIZrpvoW3V1QHNVoNNs7XVnfml
	9hTe5Zz40flHm52KN/5PRPmyYa4nCxBr8tc8O8ojsG2pR22iIRElQQOlNFKoKDpOHS8y
	pztOGz8jOE+PLoBUXJFQO5ivno1W6/0VaPtF+GgqepQvN0qu6uawX2WwUVf7fje+D6+H
	kWMPW1cQ4WwH+9gTi+xE11hwNzdUfkMvklLJmKIhdC8+zTsIodDzsnlrcEW/s33fEB9A
	GifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
	:mime-version:content-transfer-encoding;
	bh=qXttEqXX+xILch0cIH/x0SGUTmIlW1fuQh5QlqRLH7I=;
	b=CicQjMSd1pOz5tSrApjftxrZdhdPlMpEbgwbMVgS3M6VFl5C8HP9zB5B1vqTWsyaxf
	cjyf2KzkSVVves21PKxxGjSx7QXFi/nsQoosXXzdrp4fAXCE4j+cLcblcerMD+ye10J3
	E2uBi4vCYSHFOhiKmwyFDEYWTJVXfwBhtQ/FrJSoc6xW+Jj+GEFlxV7UDcsuo3tp5jM8
	6uEqwaQwb5Ji1HdnNFZiq2lJyhgU+g4IN7FMyJL0f6XEKTnDVE6cPESvkDPqHcXm9t2g
	BhU+9uT7DTLLZDxWZBk1YWadnXxNFqIVeGH0MwfcvBbDqX+pN8soBIGBBfH4HdljLRWb
	Jmlw==
X-Gm-Message-State: AA+aEWaEY27obSZlWACvvtU1J9xMTs3XPXLKS2xDgdT6qAljoCkeCRV4
	9uV3u+nJLulxB9JvQxIgGwLwjw==
X-Google-Smtp-Source: AFSGD/U9t/0ETRLqVB/bUeDmyZAKMFeDB38FahxvHrY2/VXU/+OOmMM11bXmepvMNRDLDPKiy8t1SA==
X-Received: by 2002:a63:5407:: with SMTP id i7mr26103415pgb.413.1543259741937; 
	Mon, 26 Nov 2018 11:15:41 -0800 (PST)
Received: from localhost ([12.206.222.5]) by smtp.gmail.com with ESMTPSA id
	i72sm1759267pfe.181.2018.11.26.11.15.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 11:15:41 -0800 (PST)
Date: Mon, 26 Nov 2018 11:15:41 -0800 (PST)
X-Google-Original-Date: Mon, 26 Nov 2018 11:07:41 PST (-0800)
In-Reply-To: <CAKmqyKPVif8MQs_aGXxx=aOi9mrRJz94AFv2B41JVETqY9BQRA@mail.gmail.com>
CC: logang@deltatee.com, linux@roeck-us.net, qemu-riscv@nongnu.org,
	Alistair Francis <Alistair.Francis@wdc.com>, qemu-devel@nongnu.org,
	abologna@redhat.com
From: Palmer Dabbelt <palmer@sifive.com>
To: alistair23@gmail.com
Message-ID: <mhng-3ba5a1be-87c9-4028-9442-8773ce4100bd@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-riscv] [Qemu-devel] [PATCH for-3.2 v7 5/6]
 hw/riscv/sifive_u: Connect the Xilinx PCIe
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
X-List-Received-Date: Mon, 26 Nov 2018 19:15:52 -0000

On Wed, 21 Nov 2018 18:23:26 PST (-0800), alistair23@gmail.com wrote:
> On Wed, Nov 21, 2018 at 6:13 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> On Wed, 21 Nov 2018 15:26:01 PST (-0800), logang@deltatee.com wrote:
>> >
>> >
>> > On 2018-11-21 4:10 p.m., Guenter Roeck wrote:
>> >> FWIW, I absoutely agree. If the board can only be used to boot an initrd,
>> >> it is quite pointless to have it around. Actually it is worse than pointless,
>> >> since it will result in people wasting their time trying to get it to work.
>> >
>> > As someone who has wasted their time on it, I second this sentiment.
>>
>> So it sounds like I should target that deprecation patch set for 3.1?  Who
>> wants to review it?
>
> I think it's a little late for 3.1. Let's leave it for 3.2

That was my original thought as well, so I'm happy sticking with the plan.

