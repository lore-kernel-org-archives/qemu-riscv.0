Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWIo2-00069O-9V
	for mharc-qemu-riscv@gnu.org; Wed, 06 May 2020 08:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWIo0-00066h-3q
 for qemu-riscv@nongnu.org; Wed, 06 May 2020 08:05:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45311
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWInx-0008Fd-Qb
 for qemu-riscv@nongnu.org; Wed, 06 May 2020 08:05:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588766734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lrczv+j6Wd9V8pXLvK37NjdjaIG/kQHx01eSO+UTiBk=;
 b=EgchrLQmIEYVIXi/kF8wJjSkZQ0LehWrCESmz3CjQBHgQIlFtxCc+lCSErtLonr5nGF/5J
 DC3T1yIoImy0uJQpn4bXFpeGy+dtwUOcEtbUi/iswEOdu4tSQEBZzJzbSUC+qlHb2/6zJm
 3VGPUsYu3+zkAKphRQ5es7eabG1Cwts=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-pnZ7PSvjPPK9A8SCko7E5Q-1; Wed, 06 May 2020 08:05:32 -0400
X-MC-Unique: pnZ7PSvjPPK9A8SCko7E5Q-1
Received: by mail-wr1-f71.google.com with SMTP id a12so1210888wrv.3
 for <qemu-riscv@nongnu.org>; Wed, 06 May 2020 05:05:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8UQCLO69Ng+9ievTR1YKMQ7IS7/Jm5XdR//BLbfIXfw=;
 b=uMwLG2yScP9xZx6WeF0jucz7YDtuYbXILpeyKVRF5WC1dQOUtjCcF2itfB7Z6qCkor
 cpO008buYc3K2WOzshO64Fkt3K1mkqifr6MGtSpX31glQAyz4kA8nYa0UqN7pTyBl/2V
 HA0jFZXC4Hywo4TCzpVv5LP1Xn6xhRvFk+r+uo8IfPllBPfhPuYnxRusNp/ZZmUVsZHM
 j6ZDnAOonhzNAokgNsu/SrIl7Sg75yb2cBOEy2PhSrHnnrCQTitfQtE3f/cnPp7BA1jM
 +mk6BgbNnZ+pdKmHSuNKTUDIRp2kWMD6+Hn6jvjkU5f44pluHyxX/kbntIocwfecnm6N
 9lsQ==
X-Gm-Message-State: AGi0Pub6mN08Lo1HJJceUk/LiUS53uuDOexJpGy4q7CmotT6LB8LKN4y
 WW1y2tFvpqMCu9VqLJUnckVrepreTgvS1TBwCB3Xvxsr6ybPZgijxwvkc1uowlM4upGlR7ceyYy
 VwDTkek5KSmZJzEE=
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr9993186wrs.213.1588766731227; 
 Wed, 06 May 2020 05:05:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypID9ByNWET63NHG5jI3s2sGQ4G5KBGc9yPGtQrWpDhXMstOCjyUqlA/NeU73mJBjh5ebmxqSQ==
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr9993173wrs.213.1588766731048; 
 Wed, 06 May 2020 05:05:31 -0700 (PDT)
Received: from [192.168.1.37] (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id v16sm2727732wml.30.2020.05.06.05.05.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 May 2020 05:05:30 -0700 (PDT)
Subject: Re: [PATCH v1 1/2] hw/riscv: spike: Remove deprecated ISA specific
 machines
To: Alistair Francis <alistair.francis@wdc.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: palmer@dabbelt.com, alistair23@gmail.com
References: <cover.1588727508.git.alistair.francis@wdc.com>
 <a051869c728f7f9c5e274b363ee76fc16451a043.1588727508.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <d5834a53-4c45-423e-3559-d087ade1af6f@redhat.com>
Date: Wed, 6 May 2020 14:05:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a051869c728f7f9c5e274b363ee76fc16451a043.1588727508.git.alistair.francis@wdc.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/05 23:48:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Wed, 06 May 2020 12:05:40 -0000

On 5/6/20 3:12 AM, Alistair Francis wrote:
> The ISA specific Spike machines have  been deprecated in QEMU since 4.1,
> let's finally remove them.
>=20
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/riscv/spike.c         | 217 ---------------------------------------
>   include/hw/riscv/spike.h |   6 +-
>   2 files changed, 2 insertions(+), 221 deletions(-)
>=20
> diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


