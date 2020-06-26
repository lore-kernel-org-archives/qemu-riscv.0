Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jovna-0001UI-7I
	for mharc-qemu-riscv@gnu.org; Fri, 26 Jun 2020 17:22:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jovnX-0001So-Da; Fri, 26 Jun 2020 17:22:11 -0400
Resent-Date: Fri, 26 Jun 2020 17:22:11 -0400
Resent-Message-Id: <E1jovnX-0001So-Da@lists.gnu.org>
Received: from sender4-of-o57.zoho.com ([136.143.188.57]:21744)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <no-reply@patchew.org>)
 id 1jovnU-00088p-Ux; Fri, 26 Jun 2020 17:22:11 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1593206510; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lWELCa3GiMJhnhEnunpqKnioBmtMy1ubPxX4ZQeBJzU66o1433iutryu2bURYkowVkfzs54r4nwR1wY2ovPwFe8JTPKlLJnJhdi4y4S8+bIAUccQrokKFCIpQqVFsQdXZfYoCw7PyGMvouU2ym1v9Xynn5YIcWdCPYNRcMWgfmM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1593206510;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:Reply-To:Subject:To;
 bh=0ZpV3/SV9MKS3yjkLl+eMf4TnSKlt208+OTmdH0Z/3Q=; 
 b=ca3UV9FxJBr/bvxvBm8Ui4VRnKA1J7r3GU0315S3y3rynviSIajtM6+MvV8VIQMKIE30pxxfhu1J0Z1gcAuWUHqX3UHfpvf3JYbkgK0GKi8OtSrA21Cgelm9rklhnBvhL6WCHLm8tAxgTW37OdxQMrsOECu/swRDlPX2e7FCMaQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=no-reply@patchew.org;
 dmarc=pass header.from=<no-reply@patchew.org>
 header.from=<no-reply@patchew.org>
Received: from [172.17.0.3] (23.253.156.214 [23.253.156.214]) by
 mx.zohomail.com with SMTPS id 1593206508551157.82381704701595;
 Fri, 26 Jun 2020 14:21:48 -0700 (PDT)
Message-ID: <159320650695.31217.10438128113566606768@d1fd068a5071>
Subject: Re: [PATCH 0/6] target/riscv: NaN-boxing for multiple precison
Reply-To: <qemu-devel@nongnu.org>
In-Reply-To: <20200626205917.4545-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Resent-From: 
From: no-reply@patchew.org
To: zhiwei_liu@c-sky.com
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, richard.henderson@linaro.org,
 wxy194768@alibaba-inc.com, wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com,
 palmer@dabbelt.com, zhiwei_liu@c-sky.com, ianjiang.ict@gmail.com
Date: Fri, 26 Jun 2020 14:21:48 -0700 (PDT)
X-ZohoMailClient: External
Received-SPF: pass client-ip=136.143.188.57; envelope-from=no-reply@patchew.org;
 helo=sender4-of-o57.zoho.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 17:22:06
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 21:22:11 -0000

UGF0Y2hldyBVUkw6IGh0dHBzOi8vcGF0Y2hldy5vcmcvUUVNVS8yMDIwMDYyNjIwNTkxNy40NTQ1
LTEtemhpd2VpX2xpdUBjLXNreS5jb20vCgoKCkhpLAoKVGhpcyBzZXJpZXMgZmFpbGVkIHRoZSBk
b2NrZXItbWluZ3dAZmVkb3JhIGJ1aWxkIHRlc3QuIFBsZWFzZSBmaW5kIHRoZSB0ZXN0aW5nIGNv
bW1hbmRzIGFuZAp0aGVpciBvdXRwdXQgYmVsb3cuIElmIHlvdSBoYXZlIERvY2tlciBpbnN0YWxs
ZWQsIHlvdSBjYW4gcHJvYmFibHkgcmVwcm9kdWNlIGl0CmxvY2FsbHkuCgo9PT0gVEVTVCBTQ1JJ
UFQgQkVHSU4gPT09CiMhIC9iaW4vYmFzaApleHBvcnQgQVJDSD14ODZfNjQKbWFrZSBkb2NrZXIt
aW1hZ2UtZmVkb3JhIFY9MSBORVRXT1JLPTEKdGltZSBtYWtlIGRvY2tlci10ZXN0LW1pbmd3QGZl
ZG9yYSBKPTE0IE5FVFdPUks9MQo9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQoKICAgIHJhaXNlIENh
bGxlZFByb2Nlc3NFcnJvcihyZXRjb2RlLCBjbWQpCnN1YnByb2Nlc3MuQ2FsbGVkUHJvY2Vzc0Vy
cm9yOiBDb21tYW5kICdbJ3N1ZG8nLCAnLW4nLCAnZG9ja2VyJywgJ3J1bicsICctLWxhYmVsJywg
J2NvbS5xZW11Lmluc3RhbmNlLnV1aWQ9YzI4ZjFmY2Y2OGI5NDlkZjk2YTY2OThmMWQwOThhMWUn
LCAnLXUnLCAnMTAwMycsICctLXNlY3VyaXR5LW9wdCcsICdzZWNjb21wPXVuY29uZmluZWQnLCAn
LS1ybScsICctZScsICdUQVJHRVRfTElTVD0nLCAnLWUnLCAnRVhUUkFfQ09ORklHVVJFX09QVFM9
JywgJy1lJywgJ1Y9JywgJy1lJywgJ0o9MTQnLCAnLWUnLCAnREVCVUc9JywgJy1lJywgJ1NIT1df
RU5WPScsICctZScsICdDQ0FDSEVfRElSPS92YXIvdG1wL2NjYWNoZScsICctdicsICcvaG9tZS9w
YXRjaGV3Mi8uY2FjaGUvcWVtdS1kb2NrZXItY2NhY2hlOi92YXIvdG1wL2NjYWNoZTp6JywgJy12
JywgJy92YXIvdG1wL3BhdGNoZXctdGVzdGVyLXRtcC0ydjdsYTBlZi9zcmMvZG9ja2VyLXNyYy4y
MDIwLTA2LTI2LTE3LjE2LjI5LjE3NTMxOi92YXIvdG1wL3FlbXU6eixybycsICdxZW11OmZlZG9y
YScsICcvdmFyL3RtcC9xZW11L3J1bicsICd0ZXN0LW1pbmd3J10nIHJldHVybmVkIG5vbi16ZXJv
IGV4aXQgc3RhdHVzIDIuCmZpbHRlcj0tLWZpbHRlcj1sYWJlbD1jb20ucWVtdS5pbnN0YW5jZS51
dWlkPWMyOGYxZmNmNjhiOTQ5ZGY5NmE2Njk4ZjFkMDk4YTFlCm1ha2VbMV06ICoqKiBbZG9ja2Vy
LXJ1bl0gRXJyb3IgMQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Zhci90bXAvcGF0Y2hl
dy10ZXN0ZXItdG1wLTJ2N2xhMGVmL3NyYycKbWFrZTogKioqIFtkb2NrZXItcnVuLXRlc3QtbWlu
Z3dAZmVkb3JhXSBFcnJvciAyCgpyZWFsICAgIDVtMTguODA1cwp1c2VyICAgIDBtOS4yMDFzCgoK
VGhlIGZ1bGwgbG9nIGlzIGF2YWlsYWJsZSBhdApodHRwOi8vcGF0Y2hldy5vcmcvbG9ncy8yMDIw
MDYyNjIwNTkxNy40NTQ1LTEtemhpd2VpX2xpdUBjLXNreS5jb20vdGVzdGluZy5kb2NrZXItbWlu
Z3dAZmVkb3JhLz90eXBlPW1lc3NhZ2UuCi0tLQpFbWFpbCBnZW5lcmF0ZWQgYXV0b21hdGljYWxs
eSBieSBQYXRjaGV3IFtodHRwczovL3BhdGNoZXcub3JnL10uClBsZWFzZSBzZW5kIHlvdXIgZmVl
ZGJhY2sgdG8gcGF0Y2hldy1kZXZlbEByZWRoYXQuY29t

