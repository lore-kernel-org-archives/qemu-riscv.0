Return-Path: <qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E81C52D7B
	for <qemu-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 20:49:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-riscv-bounces@nongnu.org>)
	id 1sdyRu-00069F-J7; Tue, 13 Aug 2024 16:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sdyRq-0005rs-9b
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 16:48:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sdyRo-0001aY-5Y
 for qemu-riscv@nongnu.org; Tue, 13 Aug 2024 16:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723582131;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+5q8JPWzVME9LxHSD0qURbS4KgtgRwjLQPX3M91v2oQ=;
 b=K2r64lm7q9Z0qZH/b43oAhpnxngS1XhLLKP2LwtUz7Wikczn+HofB3ezXg4WGYhcjkot1S
 zmES5ap0R3eJK87rwY/+BKgMwV/LD047hJhjqUxMEVJf+rdTwyDJeGKckRkpQ4xkIqHbrg
 H+N6LUAoiZWwK79zfcZUG4GSsZVgtG0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-407-_qUvIxMXOya5kkxUsQSkAw-1; Tue, 13 Aug 2024 16:48:47 -0400
X-MC-Unique: _qUvIxMXOya5kkxUsQSkAw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-a7ab4817f34so431402266b.2
 for <qemu-riscv@nongnu.org>; Tue, 13 Aug 2024 13:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723582126; x=1724186926;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5q8JPWzVME9LxHSD0qURbS4KgtgRwjLQPX3M91v2oQ=;
 b=cU2r7y/FdmnVc+aYjVAQ/nGdlkmVIQ+KbaV5DtP/Mty2AK6O3acF89T9kIC45edDmc
 w+MkzLUd474JYLJQ4NsNYuHHib724CH2Et4yeXi5wurb2m2BqYtNUZs771sWajMmkAkr
 zY2Ugosm+S4taw2aEQsw0RZCbyyo2wBifWlprNW1qY+zjmj+uYRMppcHSd2pWWtz/beV
 ySe3hjBTvaL2ijQUiRXTIvs8dKmb0QW543wh4IoyRh5EoqxgatQIXjgFgl4gHGsHP/Gn
 51d9SYHn7IIriCFcw5YWbNKCE2urlIrD2a5d0506ul2YsbzWy1Ysv2MLoyxEa8ySHME9
 gzVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqw3C/S+xxroUTbP4jv/tAEbGgKPdw1dAaSZJQCN3adPBi7XBAIxbLqwrY3zvgrnKz/E096nBv3I9yQQis5MNEJS6kMFI=
X-Gm-Message-State: AOJu0YygE1zj4bPVc1d2tez+jRofiWzLNXN5nWu441tMZkiNvcdL7ocV
 Jgm0TkuWS+vmANYC93clfz252WUnGPz1elDUaU8nkr6Hd+gruFNQH74KCPwY7ljnobG0H5PN+mX
 DgadbjTFFPrrkWHkr6A/2gG/1xA3kP5Vl8q78WOwcrP3NDjwtUmXB
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id
 a640c23a62f3a-a8367034961mr37156666b.52.1723582125960; 
 Tue, 13 Aug 2024 13:48:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQDYu84ZWSyvo6waTCr9yRvZxyNBuRjTV0mxTzPL4jIYD2SWop0QwnQlltR5Uim1ehY9Pipw==
X-Received: by 2002:a17:906:cadd:b0:a7a:b620:aa3a with SMTP id
 a640c23a62f3a-a8367034961mr37153966b.52.1723582125038; 
 Tue, 13 Aug 2024 13:48:45 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:346:dcde:9c09:aa95:551d:d374])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f415615dsm97515166b.187.2024.08.13.13.48.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Aug 2024 13:48:44 -0700 (PDT)
Date: Tue, 13 Aug 2024 16:48:34 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
 Michael Roth <michael.roth@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Weiwei Li <liwei1518@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Subject: Re: [PATCH v2 16/21] virtio-net: Use replay_schedule_bh_event for
 bhs that affect machine state
Message-ID: <20240813164631-mutt-send-email-mst@kernel.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-17-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240813202329.1237572-17-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org
Sender: qemu-riscv-bounces+qemu-riscv=archiver.kernel.org@nongnu.org

On Tue, Aug 13, 2024 at 09:23:24PM +0100, Alex Bennée wrote:
> From: Nicholas Piggin <npiggin@gmail.com>
> 
> The regular qemu_bh_schedule() calls result in non-deterministic
> execution of the bh in record-replay mode, which causes replay failure.
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Message-Id: <20240813050638.446172-9-npiggin@gmail.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/net/virtio-net.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 08aa0b65e3..10ebaae5e2 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -40,6 +40,7 @@
>  #include "migration/misc.h"
>  #include "standard-headers/linux/ethtool.h"
>  #include "sysemu/sysemu.h"
> +#include "sysemu/replay.h"
>  #include "trace.h"
>  #include "monitor/qdev.h"
>  #include "monitor/monitor.h"
> @@ -417,7 +418,7 @@ static void virtio_net_set_status(struct VirtIODevice *vdev, uint8_t status)
>                  timer_mod(q->tx_timer,
>                                 qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
>              } else {
> -                qemu_bh_schedule(q->tx_bh);
> +                replay_bh_schedule_event(q->tx_bh);
>              }
>          } else {
>              if (q->tx_timer) {
> @@ -2672,7 +2673,7 @@ static void virtio_net_tx_complete(NetClientState *nc, ssize_t len)
>           */
>          virtio_queue_set_notification(q->tx_vq, 0);
>          if (q->tx_bh) {
> -            qemu_bh_schedule(q->tx_bh);
> +            replay_bh_schedule_event(q->tx_bh);
>          } else {
>              timer_mod(q->tx_timer,
>                        qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + n->tx_timeout);
> @@ -2838,7 +2839,7 @@ static void virtio_net_handle_tx_bh(VirtIODevice *vdev, VirtQueue *vq)
>          return;
>      }
>      virtio_queue_set_notification(vq, 0);
> -    qemu_bh_schedule(q->tx_bh);
> +    replay_bh_schedule_event(q->tx_bh);
>  }
>  
>  static void virtio_net_tx_timer(void *opaque)
> @@ -2921,7 +2922,7 @@ static void virtio_net_tx_bh(void *opaque)
>      /* If we flush a full burst of packets, assume there are
>       * more coming and immediately reschedule */
>      if (ret >= n->tx_burst) {
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>          return;
>      }
> @@ -2935,7 +2936,7 @@ static void virtio_net_tx_bh(void *opaque)
>          return;
>      } else if (ret > 0) {
>          virtio_queue_set_notification(q->tx_vq, 0);
> -        qemu_bh_schedule(q->tx_bh);
> +        replay_bh_schedule_event(q->tx_bh);
>          q->tx_waiting = 1;
>      }
>  }
> -- 
> 2.39.2


Is this really the only way to fix this? I do not think
virtio has any business knowing about replay.
What does this API do, even? BH but not broken with replay?
Do we ever want replay broken? Why not fix qemu_bh_schedule?
And when we add another feature which we do not want to break
will we do foo_bar_replay_bh_schedule_event or what?

-- 
MST


