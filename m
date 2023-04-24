Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pqyXs-0002RQ-Me
	for mharc-qemu-riscv@gnu.org; Mon, 24 Apr 2023 11:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqyXo-0002RD-TZ
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 11:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqyXg-00068A-Dz
 for qemu-riscv@nongnu.org; Mon, 24 Apr 2023 11:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682351751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gSLSHCD7SAxmK5owuDwfhYyigkunahbHGav4UZb91bY=;
 b=eTk7S0EPTT958sZiAHqaWLzkolsaN10qDcXp489avV9Vf50txqQKhQUR7qBuQbVkdALt0v
 yS7a4wfw4xGI6akxa0RIvuSaYBYZiWyQim8xZGY78OSVkwrnV3opbGPKWOae8IlrAvqBuA
 vIOCNoS0raaqAjK5vufclPez93M69Uo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-Ho1COsM5OcW5KQ02Lqu7rQ-1; Mon, 24 Apr 2023 11:55:49 -0400
X-MC-Unique: Ho1COsM5OcW5KQ02Lqu7rQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-2fa5d643cd8so1348578f8f.2
 for <qemu-riscv@nongnu.org>; Mon, 24 Apr 2023 08:55:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682351748; x=1684943748;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gSLSHCD7SAxmK5owuDwfhYyigkunahbHGav4UZb91bY=;
 b=hvHnfv9usRVAc4mnWmfRYJCiVbprXl5Q+hGELG7zvxKEbHEJ8QvwYn4AKDCyejfYi2
 IIZY3oG4G1+8sn5brxTvo4DMlCeY1uPYuAKQ6hihJKNALj/TYBOWbHY/P8hfAxIzpW2+
 FQ/tYeznWGioaVdHTVzTL7DAsgBCycVePdExH9pSRM2DFMlTC2xL9lkzxxm126JZjcH7
 ifi+mgilMXvBSqtx19c/yXpbB0hV+JJe0NJK82ts6lUiNivPV6s2UUqvAR6yyjdSBjKW
 S9o7CCWCmVWe+zRJovGKV9kbEHuixQO/x+IwbELijvQm7LwpqUHBcisQ6uVC50SCgOJQ
 pn8g==
X-Gm-Message-State: AAQBX9dfBjypCJLHsv69Qs+6Ujv41KyvPKU/F1b8OZY70Q7tO30N+MYi
 GHshED/f1/ftucvqxslYZ2UPILUqSQzx7iW2Rw8PJTHLHRNpK/wQ9hGJxms3KNscaxvN2h1EG67
 KWPfSAERSQYVQ8wU=
X-Received: by 2002:a5d:54c6:0:b0:2f7:f803:ebeb with SMTP id
 x6-20020a5d54c6000000b002f7f803ebebmr10334554wrv.52.1682351748575; 
 Mon, 24 Apr 2023 08:55:48 -0700 (PDT)
X-Google-Smtp-Source: AKy350avfcfrl6ufw+2a5Hff0ttxQl1WDs3k+JxP4zVFIseU6kPapwXjKg2V5q4Z5yikr20KaDXRhA==
X-Received: by 2002:a5d:54c6:0:b0:2f7:f803:ebeb with SMTP id
 x6-20020a5d54c6000000b002f7f803ebebmr10334531wrv.52.1682351748317; 
 Mon, 24 Apr 2023 08:55:48 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 e14-20020a5d500e000000b002cff0e213ddsm10995201wrt.14.2023.04.24.08.55.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 08:55:47 -0700 (PDT)
Message-ID: <fa91e8cf-2240-ac81-740b-b9d8597f4f59@redhat.com>
Date: Mon, 24 Apr 2023 17:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] update-linux-headers: sync-up header with Linux for
 KVM AIA support
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org
Cc: rkanwal@rivosinc.com, anup@brainfault.org, dbarboza@ventanamicro.com,
 atishp@atishpatra.org, vincent.chen@sifive.com, greentime.hu@sifive.com,
 frank.chang@sifive.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Chenyi Qiang <chenyi.qiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org
References: <20230424090716.15674-1-yongxuan.wang@sifive.com>
 <20230424090716.15674-2-yongxuan.wang@sifive.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424090716.15674-2-yongxuan.wang@sifive.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 24 Apr 2023 15:56:03 -0000

On 24/04/2023 11.07, Yong-Xuan Wang wrote:
> Sync-up Linux header to get latest KVM RISC-V headers having AIA support.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Jim Shu <jim.shu@sifive.com>
> ---
>   linux-headers/linux/kvm.h |  2 ++
>   target/riscv/kvm_riscv.h  | 33 +++++++++++++++++++++++++++++++++

  Hi!

Please don't mix updates to linux-headers/ with updates to other files. 
linux-headers/ should only by updated via the 
scripts/update-linux-headers.sh script, and then the whole update should be 
included in the patch, not only selected files.

Thanks,
   Thomas


